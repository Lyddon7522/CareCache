import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../core/database/app_database.dart';
import 'inventory_store.dart';
import 'inventory_tables.dart';
import 'supply.dart';

final class DriftInventoryStore implements InventoryStore {
  DriftInventoryStore(this._database, {this._uuid = const Uuid()});

  final AppDatabase _database;
  final Uuid _uuid;

  @override
  Stream<List<SupplyItem>> watchSupplies() {
    final query = _database.select(_database.supplyRecords)
      ..where((table) => table.archivedAt.isNull())
      ..orderBy(<OrderingTerm Function(SupplyRecords)>[
        (table) => OrderingTerm.asc(table.name),
      ]);
    return query.watch().map(
      (rows) => rows.map(_supplyFromRecord).toList(growable: false),
    );
  }

  @override
  Stream<SupplyItem?> watchSupply(String id) {
    final query = _database.select(_database.supplyRecords)
      ..where((table) => table.id.equals(id) & table.archivedAt.isNull());
    return query.watchSingleOrNull().map(
      (row) => row == null ? null : _supplyFromRecord(row),
    );
  }

  @override
  Future<SupplyItem?> findByBarcode(String barcode) async {
    final normalized = _optionalText(barcode);
    if (normalized == null) {
      return null;
    }
    final query = _database.select(_database.supplyRecords)
      ..where(
        (table) => table.barcode.equals(normalized) & table.archivedAt.isNull(),
      );
    final row = await query.getSingleOrNull();
    return row == null ? null : _supplyFromRecord(row);
  }

  @override
  Future<String> save(SupplyDraft draft, {String? id}) async {
    final now = DateTime.now().toUtc();
    final supplyId = id ?? _uuid.v4();
    final barcode = _optionalText(draft.barcode);

    return _database.transaction(() async {
      final existingQuery = _database.select(_database.supplyRecords)
        ..where((table) => table.id.equals(supplyId));
      final existing = await existingQuery.getSingleOrNull();

      if (barcode != null) {
        final duplicateQuery = _database.select(_database.supplyRecords)
          ..where(
            (table) =>
                table.barcode.equals(barcode) &
                table.archivedAt.isNull() &
                table.id.equals(supplyId).not(),
          );
        if (await duplicateQuery.getSingleOrNull() != null) {
          throw DuplicateBarcodeException(barcode);
        }
      }

      final quantity = _nonNegative(draft.quantityOnHand);
      final companion = SupplyRecordsCompanion.insert(
        id: supplyId,
        deviceId: Value<String?>(_optionalText(draft.deviceId)),
        name: draft.name.trim(),
        category: draft.category.name,
        brand: Value<String?>(_optionalText(draft.brand)),
        modelNumber: Value<String?>(_optionalText(draft.modelNumber)),
        barcode: Value<String?>(barcode),
        lotNumber: Value<String?>(_optionalText(draft.lotNumber)),
        expirationDate: Value<DateTime?>(_utc(draft.expirationDate)),
        unitLabel: Value<String>(draft.unitLabel.trim()),
        quantityOnHand: Value<int>(quantity),
        reorderPoint: Value<int>(_nonNegative(draft.reorderPoint)),
        replacementCadenceDays: Value<int?>(
          draft.replacementCadenceDays == null
              ? null
              : _positiveOrNull(draft.replacementCadenceDays!),
        ),
        lastReplacedAt: Value<DateTime?>(_utc(draft.lastReplacedAt)),
        nextReplacementAt: Value<DateTime?>(_utc(draft.nextReplacementAt)),
        storageLocation: Value<String?>(_optionalText(draft.storageLocation)),
        notes: Value<String?>(_optionalText(draft.notes)),
        imagePath: Value<String?>(_optionalText(draft.imagePath)),
        createdAt: existing?.createdAt ?? now,
        updatedAt: now,
      );
      await _database.into(_database.supplyRecords).insertOnConflictUpdate(companion);

      final delta = quantity - (existing?.quantityOnHand ?? 0);
      if (delta != 0) {
        await _insertEvent(
          supplyId: supplyId,
          kind: existing == null && delta > 0
              ? InventoryEventKind.stockIn
              : InventoryEventKind.adjustment,
          delta: delta,
          occurredAt: now,
          note: existing == null ? 'Initial quantity' : 'Quantity edited',
        );
      }
      return supplyId;
    });
  }

  @override
  Future<void> adjust(
    String supplyId,
    int requestedDelta, {
    required InventoryEventKind kind,
    String? note,
  }) async {
    if (requestedDelta == 0) {
      return;
    }
    await _database.transaction(() async {
      final query = _database.select(_database.supplyRecords)
        ..where((table) => table.id.equals(supplyId) & table.archivedAt.isNull());
      final existing = await query.getSingleOrNull();
      if (existing == null) {
        throw SupplyNotFoundException(supplyId);
      }
      final nextQuantity = _nonNegative(existing.quantityOnHand + requestedDelta);
      final actualDelta = nextQuantity - existing.quantityOnHand;
      if (actualDelta == 0) {
        return;
      }
      final now = DateTime.now().toUtc();
      await (_database.update(
        _database.supplyRecords,
      )..where((table) => table.id.equals(supplyId))).write(
        SupplyRecordsCompanion(
          quantityOnHand: Value<int>(nextQuantity),
          updatedAt: Value<DateTime>(now),
        ),
      );
      await _insertEvent(
        supplyId: supplyId,
        kind: kind,
        delta: actualDelta,
        occurredAt: now,
        note: note,
      );
    });
  }

  @override
  Future<void> markReplaced(String supplyId, {DateTime? replacedAt}) async {
    await _database.transaction(() async {
      final query = _database.select(_database.supplyRecords)
        ..where((table) => table.id.equals(supplyId) & table.archivedAt.isNull());
      final existing = await query.getSingleOrNull();
      if (existing == null) {
        throw SupplyNotFoundException(supplyId);
      }
      final completed = (replacedAt ?? DateTime.now()).toUtc();
      final cadence = existing.replacementCadenceDays;
      final next = cadence == null ? null : completed.add(Duration(days: cadence));
      final delta = existing.quantityOnHand > 0 ? -1 : 0;
      await (_database.update(
        _database.supplyRecords,
      )..where((table) => table.id.equals(supplyId))).write(
        SupplyRecordsCompanion(
          quantityOnHand: Value<int>(existing.quantityOnHand + delta),
          lastReplacedAt: Value<DateTime?>(completed),
          nextReplacementAt: Value<DateTime?>(next),
          updatedAt: Value<DateTime>(completed),
        ),
      );
      await _insertEvent(
        supplyId: supplyId,
        kind: InventoryEventKind.replacement,
        delta: delta,
        occurredAt: completed,
        note: 'Replacement recorded',
      );
    });
  }

  @override
  Future<void> archive(String id) async {
    final now = DateTime.now().toUtc();
    await (_database.update(_database.supplyRecords)..where((table) => table.id.equals(id))).write(
      SupplyRecordsCompanion(
        archivedAt: Value<DateTime?>(now),
        updatedAt: Value<DateTime>(now),
      ),
    );
  }

  Future<void> _insertEvent({
    required String supplyId,
    required InventoryEventKind kind,
    required int delta,
    required DateTime occurredAt,
    String? note,
  }) async {
    await _database
        .into(_database.inventoryEventRecords)
        .insert(
          InventoryEventRecordsCompanion.insert(
            id: _uuid.v4(),
            supplyId: supplyId,
            kind: kind.name,
            delta: delta,
            occurredAt: occurredAt.toUtc(),
            note: Value<String?>(_optionalText(note)),
          ),
        );
  }
}

SupplyItem _supplyFromRecord(SupplyRecord row) {
  return SupplyItem(
    id: row.id,
    deviceId: row.deviceId,
    name: row.name,
    category: SupplyCategory.values.firstWhere(
      (category) => category.name == row.category,
      orElse: () => SupplyCategory.other,
    ),
    brand: row.brand,
    modelNumber: row.modelNumber,
    barcode: row.barcode,
    lotNumber: row.lotNumber,
    expirationDate: row.expirationDate,
    unitLabel: row.unitLabel,
    quantityOnHand: row.quantityOnHand,
    reorderPoint: row.reorderPoint,
    replacementCadenceDays: row.replacementCadenceDays,
    lastReplacedAt: row.lastReplacedAt,
    nextReplacementAt: row.nextReplacementAt,
    storageLocation: row.storageLocation,
    notes: row.notes,
    imagePath: row.imagePath,
    createdAt: row.createdAt,
    updatedAt: row.updatedAt,
    archivedAt: row.archivedAt,
  );
}

String? _optionalText(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

DateTime? _utc(DateTime? value) => value?.toUtc();

int _nonNegative(int value) => value < 0 ? 0 : value;

int? _positiveOrNull(int value) => value < 1 ? null : value;

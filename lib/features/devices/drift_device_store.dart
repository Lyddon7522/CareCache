import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../core/database/app_database.dart';
import 'device.dart';
import 'device_store.dart';
import 'device_tables.dart';

final class DriftDeviceStore implements DeviceStore {
  DriftDeviceStore(this._database, {this._uuid = const Uuid()});

  final AppDatabase _database;
  final Uuid _uuid;

  @override
  Stream<List<MedicalDevice>> watchDevices() {
    final query = _database.select(_database.deviceRecords)
      ..where((table) => table.archivedAt.isNull())
      ..orderBy(<OrderingTerm Function(DeviceRecords)>[
        (table) => OrderingTerm.asc(table.name),
      ]);
    return query.watch().map(
      (rows) => rows.map(_deviceFromRecord).toList(growable: false),
    );
  }

  @override
  Stream<MedicalDevice?> watchDevice(String id) {
    final query = _database.select(_database.deviceRecords)
      ..where((table) => table.id.equals(id) & table.archivedAt.isNull());
    return query.watchSingleOrNull().map(
      (row) => row == null ? null : _deviceFromRecord(row),
    );
  }

  @override
  Future<String> save(DeviceDraft draft, {String? id}) async {
    final now = DateTime.now().toUtc();
    final deviceId = id ?? _uuid.v4();
    final query = _database.select(_database.deviceRecords)
      ..where((table) => table.id.equals(deviceId));
    final existing = await query.getSingleOrNull();
    final companion = DeviceRecordsCompanion.insert(
      id: deviceId,
      name: draft.name.trim(),
      category: draft.category.name,
      manufacturer: Value<String?>(_optionalText(draft.manufacturer)),
      modelNumber: Value<String?>(_optionalText(draft.modelNumber)),
      serialNumber: Value<String?>(_optionalText(draft.serialNumber)),
      installedAt: Value<DateTime?>(_utc(draft.installedAt)),
      warrantyExpiresAt: Value<DateTime?>(_utc(draft.warrantyExpiresAt)),
      supplier: Value<String?>(_optionalText(draft.supplier)),
      manualUrl: Value<String?>(_optionalText(draft.manualUrl)),
      storageLocation: Value<String?>(_optionalText(draft.storageLocation)),
      prescriptionMode: Value<String?>(_optionalText(draft.prescriptionMode)),
      pressureMin: Value<double?>(draft.pressureMin),
      pressureMax: Value<double?>(draft.pressureMax),
      pressureUnit: Value<String?>(_optionalText(draft.pressureUnit)),
      humidifierSetting: Value<String?>(_optionalText(draft.humidifierSetting)),
      rampMinutes: Value<int?>(draft.rampMinutes),
      prescribedBy: Value<String?>(_optionalText(draft.prescribedBy)),
      prescribedAt: Value<DateTime?>(_utc(draft.prescribedAt)),
      prescriptionNotes: Value<String?>(_optionalText(draft.prescriptionNotes)),
      notes: Value<String?>(_optionalText(draft.notes)),
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    );
    await _database.into(_database.deviceRecords).insertOnConflictUpdate(companion);
    return deviceId;
  }

  @override
  Future<void> archive(String id) async {
    final now = DateTime.now().toUtc();
    await (_database.update(_database.deviceRecords)..where((table) => table.id.equals(id))).write(
      DeviceRecordsCompanion(
        archivedAt: Value<DateTime?>(now),
        updatedAt: Value<DateTime>(now),
      ),
    );
  }
}

MedicalDevice _deviceFromRecord(DeviceRecord row) {
  return MedicalDevice(
    id: row.id,
    name: row.name,
    category: DeviceCategory.values.firstWhere(
      (category) => category.name == row.category,
      orElse: () => DeviceCategory.other,
    ),
    manufacturer: row.manufacturer,
    modelNumber: row.modelNumber,
    serialNumber: row.serialNumber,
    installedAt: row.installedAt,
    warrantyExpiresAt: row.warrantyExpiresAt,
    supplier: row.supplier,
    manualUrl: row.manualUrl,
    storageLocation: row.storageLocation,
    prescriptionMode: row.prescriptionMode,
    pressureMin: row.pressureMin,
    pressureMax: row.pressureMax,
    pressureUnit: row.pressureUnit,
    humidifierSetting: row.humidifierSetting,
    rampMinutes: row.rampMinutes,
    prescribedBy: row.prescribedBy,
    prescribedAt: row.prescribedAt,
    prescriptionNotes: row.prescriptionNotes,
    notes: row.notes,
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

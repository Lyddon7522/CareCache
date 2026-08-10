import 'package:carecache/core/database/app_database.dart';
import 'package:carecache/features/inventory/drift_inventory_store.dart';
import 'package:carecache/features/inventory/inventory_store.dart';
import 'package:carecache/features/inventory/supply.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase database;
  late DriftInventoryStore store;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory());
    store = DriftInventoryStore(database);
  });

  tearDown(() => database.close());

  test('saves a supply and records quantity changes transactionally', () async {
    final id = await store.save(
      const SupplyDraft(
        name: 'Synthetic fine filter',
        category: SupplyCategory.cpap,
        unitLabel: 'filter',
        quantityOnHand: 2,
        reorderPoint: 1,
        barcode: '000000000000',
      ),
    );

    await store.adjust(id, -9, kind: InventoryEventKind.used);

    final supply = await store.watchSupply(id).first;
    final events = await database.select(database.inventoryEventRecords).get();
    expect(supply, isNotNull);
    expect(supply!.quantityOnHand, 0);
    expect(events.map((event) => event.delta), containsAll(<int>[2, -2]));
  });

  test('rejects a duplicate active barcode', () async {
    const first = SupplyDraft(
      name: 'Synthetic mask cushion A',
      category: SupplyCategory.cpap,
      unitLabel: 'cushion',
      quantityOnHand: 1,
      reorderPoint: 0,
      barcode: '111111111111',
    );
    const second = SupplyDraft(
      name: 'Synthetic mask cushion B',
      category: SupplyCategory.cpap,
      unitLabel: 'cushion',
      quantityOnHand: 1,
      reorderPoint: 0,
      barcode: '111111111111',
    );
    await store.save(first);

    await expectLater(store.save(second), throwsA(isA<DuplicateBarcodeException>()));
  });

  test('marking a replacement consumes stock and advances cadence', () async {
    final id = await store.save(
      const SupplyDraft(
        name: 'Synthetic hose',
        category: SupplyCategory.cpap,
        unitLabel: 'hose',
        quantityOnHand: 3,
        reorderPoint: 1,
        replacementCadenceDays: 30,
      ),
    );
    final replacedAt = DateTime.utc(2026, 8, 9, 15);

    await store.markReplaced(id, replacedAt: replacedAt);

    final supply = await store.watchSupply(id).first;
    expect(supply!.quantityOnHand, 2);
    expect(supply.lastReplacedAt!.isAtSameMomentAs(replacedAt), isTrue);
    expect(
      supply.nextReplacementAt!.isAtSameMomentAs(DateTime.utc(2026, 9, 8, 15)),
      isTrue,
    );
  });

  test('a matching scanned barcode confirms and records a replacement', () async {
    final id = await store.save(
      const SupplyDraft(
        name: 'Synthetic mask cushion',
        category: SupplyCategory.cpap,
        unitLabel: 'cushion',
        quantityOnHand: 2,
        reorderPoint: 1,
        barcode: '222222222222',
        replacementCadenceDays: 30,
      ),
    );

    await store.markReplaced(id, scannedBarcode: ' 222222222222 ');

    final supply = await store.watchSupply(id).first;
    final events = await database.select(database.inventoryEventRecords).get();
    final replacementEvent = events.singleWhere(
      (event) => event.kind == InventoryEventKind.replacement.name,
    );
    expect(supply!.quantityOnHand, 1);
    expect(supply.lastReplacedAt, isNotNull);
    expect(replacementEvent.delta, -1);
  });

  test('a mismatched replacement barcode rolls back every inventory change', () async {
    final id = await store.save(
      const SupplyDraft(
        name: 'Synthetic water chamber',
        category: SupplyCategory.cpap,
        unitLabel: 'chamber',
        quantityOnHand: 2,
        reorderPoint: 1,
        barcode: '333333333333',
        replacementCadenceDays: 90,
      ),
    );
    final eventsBefore = await database.select(database.inventoryEventRecords).get();

    await expectLater(
      store.markReplaced(id, scannedBarcode: '444444444444'),
      throwsA(isA<SupplyBarcodeMismatchException>()),
    );

    final supply = await store.watchSupply(id).first;
    final eventsAfter = await database.select(database.inventoryEventRecords).get();
    expect(supply!.quantityOnHand, 2);
    expect(supply.lastReplacedAt, isNull);
    expect(supply.nextReplacementAt, isNull);
    expect(eventsAfter.length, eventsBefore.length);
  });

  test('a scanned replacement with no stock rolls back the replacement', () async {
    final id = await store.save(
      const SupplyDraft(
        name: 'Synthetic hose',
        category: SupplyCategory.cpap,
        unitLabel: 'hose',
        quantityOnHand: 0,
        reorderPoint: 1,
        barcode: '555555555555',
        replacementCadenceDays: 180,
      ),
    );

    await expectLater(
      store.markReplaced(id, scannedBarcode: '555555555555'),
      throwsA(isA<ReplacementInventoryEmptyException>()),
    );

    final supply = await store.watchSupply(id).first;
    final events = await database.select(database.inventoryEventRecords).get();
    expect(supply!.quantityOnHand, 0);
    expect(supply.lastReplacedAt, isNull);
    expect(supply.nextReplacementAt, isNull);
    expect(events, isEmpty);
  });
}

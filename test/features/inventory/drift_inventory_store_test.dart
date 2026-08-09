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
}

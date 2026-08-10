import 'package:carecache/app/app_dependencies.dart';
import 'package:carecache/app/care_cache_app.dart';
import 'package:carecache/core/database/app_database.dart';
import 'package:carecache/features/inventory/save_supply/save_supply.dart';
import 'package:carecache/features/inventory/supply.dart';
import 'package:carecache/features/schedule/reminder_scheduler.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('scanning a matching replacement deducts one item', (tester) async {
    final dependencies = await _pumpInventory(
      tester,
      barcode: '666666666666',
    );

    await _openReplacementSheet(tester);

    expect(find.text('Scan replacement'), findsOneWidget);
    expect(find.text('Record without scanning'), findsOneWidget);

    await tester.tap(find.text('Scan replacement'));
    await tester.pumpAndSettle();
    expect(find.text('Camera access is optional'), findsOneWidget);

    await _enterBarcode(tester, '666666666666');

    expect(
      find.text('Replacement recorded. One item was deducted from inventory.'),
      findsOneWidget,
    );
    expect(find.text('1 cushion'), findsOneWidget);
    final supply = await dependencies.database
        .select(dependencies.database.supplyRecords)
        .getSingle();
    final events = await dependencies.database
        .select(dependencies.database.inventoryEventRecords)
        .get();
    expect(supply.quantityOnHand, 1);
    expect(
      events.where((event) => event.kind == InventoryEventKind.replacement.name).single.delta,
      -1,
    );
    await _disposeApp(tester, dependencies);
  });

  testWidgets('a mismatched replacement scan leaves inventory unchanged', (tester) async {
    final dependencies = await _pumpInventory(
      tester,
      barcode: '777777777777',
    );

    await _openReplacementSheet(tester);
    await tester.tap(find.text('Scan replacement'));
    await tester.pumpAndSettle();
    await _enterBarcode(tester, '888888888888');

    expect(
      find.text(
        'That barcode does not match Synthetic mask cushion. Inventory was not changed.',
      ),
      findsOneWidget,
    );
    expect(find.text('2 cushion'), findsOneWidget);
    final supply = await dependencies.database
        .select(dependencies.database.supplyRecords)
        .getSingle();
    final events = await dependencies.database
        .select(dependencies.database.inventoryEventRecords)
        .get();
    expect(supply.quantityOnHand, 2);
    expect(events.where((event) => event.kind == InventoryEventKind.replacement.name), isEmpty);
    await _disposeApp(tester, dependencies);
  });

  testWidgets('a replacement can still be recorded without scanning', (tester) async {
    final dependencies = await _pumpInventory(
      tester,
      barcode: '999999999999',
    );

    await _openReplacementSheet(tester);
    await tester.tap(find.text('Record without scanning'));
    await tester.pumpAndSettle();

    expect(find.text('Replacement recorded.'), findsOneWidget);
    expect(find.text('1 cushion'), findsOneWidget);
    final supply = await dependencies.database
        .select(dependencies.database.supplyRecords)
        .getSingle();
    expect(supply.quantityOnHand, 1);
    await _disposeApp(tester, dependencies);
  });
}

Future<AppDependencies> _pumpInventory(
  WidgetTester tester, {
  required String barcode,
}) async {
  tester.view.physicalSize = const Size(430, 900);
  tester.view.devicePixelRatio = 1;
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
  final dependencies = await AppDependencies.create(
    database: AppDatabase(NativeDatabase.memory()),
    reminders: const NoopReminderScheduler(),
  );
  await dependencies.mediator.send<String>(
    SaveSupplyCommand(
      SupplyDraft(
        name: 'Synthetic mask cushion',
        category: SupplyCategory.cpap,
        unitLabel: 'cushion',
        quantityOnHand: 2,
        reorderPoint: 1,
        barcode: barcode,
        replacementCadenceDays: 30,
      ),
    ),
  );

  await tester.pumpWidget(CareCacheApp(dependencies: dependencies));
  await tester.pumpAndSettle();
  final inventoryDestination = find.descendant(
    of: find.byType(NavigationBar),
    matching: find.byIcon(Icons.inventory_2_outlined),
  );
  await tester.tap(inventoryDestination);
  await tester.pumpAndSettle();
  return dependencies;
}

Future<void> _openReplacementSheet(WidgetTester tester) async {
  await tester.ensureVisible(find.text('Mark replaced'));
  await tester.pumpAndSettle();
  await tester.tap(find.text('Mark replaced'));
  await tester.pumpAndSettle();
}

Future<void> _disposeApp(WidgetTester tester, AppDependencies dependencies) async {
  await tester.pumpWidget(const SizedBox.shrink());
  await tester.pump(const Duration(milliseconds: 1));
  await tester.pump(const Duration(milliseconds: 1));
  await dependencies.dispose();
}

Future<void> _enterBarcode(WidgetTester tester, String barcode) async {
  await tester.tap(find.text('Enter manually'));
  await tester.pumpAndSettle();
  final barcodeField = find.descendant(
    of: find.byType(AlertDialog),
    matching: find.byType(TextField),
  );
  await tester.enterText(barcodeField, barcode);
  await tester.tap(find.widgetWithText(FilledButton, 'Done'));
  await tester.pumpAndSettle();
}

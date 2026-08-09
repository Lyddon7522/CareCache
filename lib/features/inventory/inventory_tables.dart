import 'package:drift/drift.dart';

@DataClassName('SupplyRecord')
class SupplyRecords extends Table {
  TextColumn get id => text()();

  TextColumn get deviceId => text().nullable()();

  TextColumn get name => text()();

  TextColumn get category => text()();

  TextColumn get brand => text().nullable()();

  TextColumn get modelNumber => text().nullable()();

  TextColumn get barcode => text().nullable()();

  TextColumn get lotNumber => text().nullable()();

  DateTimeColumn get expirationDate => dateTime().nullable()();

  TextColumn get unitLabel => text().withDefault(const Constant<String>('item'))();

  IntColumn get quantityOnHand => integer().withDefault(const Constant<int>(0))();

  IntColumn get reorderPoint => integer().withDefault(const Constant<int>(0))();

  IntColumn get replacementCadenceDays => integer().nullable()();

  DateTimeColumn get lastReplacedAt => dateTime().nullable()();

  DateTimeColumn get nextReplacementAt => dateTime().nullable()();

  TextColumn get storageLocation => text().nullable()();

  TextColumn get notes => text().nullable()();

  TextColumn get imagePath => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  DateTimeColumn get archivedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName('InventoryEventRecord')
class InventoryEventRecords extends Table {
  TextColumn get id => text()();

  TextColumn get supplyId => text().references(SupplyRecords, #id, onDelete: KeyAction.cascade)();

  TextColumn get kind => text()();

  IntColumn get delta => integer()();

  DateTimeColumn get occurredAt => dateTime()();

  TextColumn get note => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

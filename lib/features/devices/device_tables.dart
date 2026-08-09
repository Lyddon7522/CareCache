import 'package:drift/drift.dart';

@DataClassName('DeviceRecord')
class DeviceRecords extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  TextColumn get category => text()();

  TextColumn get manufacturer => text().nullable()();

  TextColumn get modelNumber => text().nullable()();

  TextColumn get serialNumber => text().nullable()();

  DateTimeColumn get installedAt => dateTime().nullable()();

  DateTimeColumn get warrantyExpiresAt => dateTime().nullable()();

  TextColumn get supplier => text().nullable()();

  TextColumn get manualUrl => text().nullable()();

  TextColumn get storageLocation => text().nullable()();

  TextColumn get prescriptionMode => text().nullable()();

  RealColumn get pressureMin => real().nullable()();

  RealColumn get pressureMax => real().nullable()();

  TextColumn get pressureUnit => text().nullable()();

  TextColumn get humidifierSetting => text().nullable()();

  IntColumn get rampMinutes => integer().nullable()();

  TextColumn get prescribedBy => text().nullable()();

  DateTimeColumn get prescribedAt => dateTime().nullable()();

  TextColumn get prescriptionNotes => text().nullable()();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  DateTimeColumn get archivedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

import 'package:drift/drift.dart';

@DataClassName('PreferenceRecord')
class PreferenceRecords extends Table {
  TextColumn get key => text()();

  TextColumn get value => text()();

  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{key};
}

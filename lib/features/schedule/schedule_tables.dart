import 'package:drift/drift.dart';

@DataClassName('CareTaskRecord')
class CareTaskRecords extends Table {
  TextColumn get id => text()();

  TextColumn get deviceId => text().nullable()();

  TextColumn get supplyId => text().nullable()();

  TextColumn get title => text()();

  TextColumn get kind => text()();

  IntColumn get cadenceDays => integer()();

  DateTimeColumn get nextDueAt => dateTime()();

  DateTimeColumn get lastCompletedAt => dateTime().nullable()();

  BoolColumn get remindersEnabled => boolean().withDefault(const Constant<bool>(true))();

  IntColumn get reminderMinutesAfterMidnight => integer().withDefault(const Constant<int>(540))();

  TextColumn get notes => text().nullable()();

  DateTimeColumn get createdAt => dateTime()();

  DateTimeColumn get updatedAt => dateTime()();

  DateTimeColumn get archivedAt => dateTime().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

@DataClassName('TaskCompletionRecord')
class TaskCompletionRecords extends Table {
  TextColumn get id => text()();

  TextColumn get taskId => text().references(CareTaskRecords, #id, onDelete: KeyAction.cascade)();

  DateTimeColumn get completedAt => dateTime()();

  TextColumn get note => text().nullable()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../core/database/app_database.dart';
import 'care_task.dart';
import 'schedule_store.dart';
import 'schedule_tables.dart';

final class DriftScheduleStore implements ScheduleStore {
  DriftScheduleStore(this._database, {this._uuid = const Uuid()});

  final AppDatabase _database;
  final Uuid _uuid;

  @override
  Stream<List<CareTask>> watchTasks() {
    final query = _database.select(_database.careTaskRecords)
      ..where((table) => table.archivedAt.isNull())
      ..orderBy(<OrderingTerm Function(CareTaskRecords)>[
        (table) => OrderingTerm.asc(table.nextDueAt),
      ]);
    return query.watch().map(
      (rows) => rows.map(_taskFromRecord).toList(growable: false),
    );
  }

  @override
  Stream<CareTask?> watchTask(String id) {
    final query = _database.select(_database.careTaskRecords)
      ..where((table) => table.id.equals(id) & table.archivedAt.isNull());
    return query.watchSingleOrNull().map(
      (row) => row == null ? null : _taskFromRecord(row),
    );
  }

  @override
  Future<CareTask?> getTask(String id) async {
    final query = _database.select(_database.careTaskRecords)
      ..where((table) => table.id.equals(id) & table.archivedAt.isNull());
    final row = await query.getSingleOrNull();
    return row == null ? null : _taskFromRecord(row);
  }

  @override
  Future<String> save(CareTaskDraft draft, {String? id}) async {
    final now = DateTime.now().toUtc();
    final taskId = id ?? _uuid.v4();
    final query = _database.select(_database.careTaskRecords)
      ..where((table) => table.id.equals(taskId));
    final existing = await query.getSingleOrNull();
    final companion = CareTaskRecordsCompanion.insert(
      id: taskId,
      deviceId: Value<String?>(_optionalText(draft.deviceId)),
      supplyId: Value<String?>(_optionalText(draft.supplyId)),
      title: draft.title.trim(),
      kind: draft.kind.name,
      cadenceDays: _positive(draft.cadenceDays),
      nextDueAt: draft.nextDueAt.toUtc(),
      lastCompletedAt: Value<DateTime?>(existing?.lastCompletedAt),
      remindersEnabled: Value<bool>(draft.remindersEnabled),
      reminderMinutesAfterMidnight: Value<int>(
        draft.reminderMinutesAfterMidnight.clamp(0, 1439),
      ),
      notes: Value<String?>(_optionalText(draft.notes)),
      createdAt: existing?.createdAt ?? now,
      updatedAt: now,
    );
    await _database.into(_database.careTaskRecords).insertOnConflictUpdate(companion);
    return taskId;
  }

  @override
  Future<CareTask> complete(
    String id, {
    DateTime? completedAt,
    String? note,
  }) async {
    return _database.transaction(() async {
      final query = _database.select(_database.careTaskRecords)
        ..where((table) => table.id.equals(id) & table.archivedAt.isNull());
      final existing = await query.getSingleOrNull();
      if (existing == null) {
        throw CareTaskNotFoundException(id);
      }
      final completed = (completedAt ?? DateTime.now()).toUtc();
      final next = completed.add(Duration(days: _positive(existing.cadenceDays)));
      await _database
          .into(_database.taskCompletionRecords)
          .insert(
            TaskCompletionRecordsCompanion.insert(
              id: _uuid.v4(),
              taskId: id,
              completedAt: completed,
              note: Value<String?>(_optionalText(note)),
            ),
          );
      await (_database.update(
        _database.careTaskRecords,
      )..where((table) => table.id.equals(id))).write(
        CareTaskRecordsCompanion(
          lastCompletedAt: Value<DateTime?>(completed),
          nextDueAt: Value<DateTime>(next),
          updatedAt: Value<DateTime>(completed),
        ),
      );
      return _taskFromRecord(
        existing.copyWith(lastCompletedAt: Value<DateTime?>(completed), nextDueAt: next),
      );
    });
  }

  @override
  Future<void> archive(String id) async {
    final now = DateTime.now().toUtc();
    await (_database.update(
      _database.careTaskRecords,
    )..where((table) => table.id.equals(id))).write(
      CareTaskRecordsCompanion(
        archivedAt: Value<DateTime?>(now),
        updatedAt: Value<DateTime>(now),
      ),
    );
  }
}

CareTask _taskFromRecord(CareTaskRecord row) {
  return CareTask(
    id: row.id,
    deviceId: row.deviceId,
    supplyId: row.supplyId,
    title: row.title,
    kind: CareTaskKind.values.firstWhere(
      (kind) => kind.name == row.kind,
      orElse: () => CareTaskKind.custom,
    ),
    cadenceDays: row.cadenceDays,
    nextDueAt: row.nextDueAt,
    lastCompletedAt: row.lastCompletedAt,
    remindersEnabled: row.remindersEnabled,
    reminderMinutesAfterMidnight: row.reminderMinutesAfterMidnight,
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

int _positive(int value) => value < 1 ? 1 : value;

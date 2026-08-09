import 'care_task.dart';

abstract interface class ScheduleStore {
  Stream<List<CareTask>> watchTasks();

  Stream<CareTask?> watchTask(String id);

  Future<CareTask?> getTask(String id);

  Future<String> save(CareTaskDraft draft, {String? id});

  Future<CareTask> complete(String id, {DateTime? completedAt, String? note});

  Future<void> archive(String id);
}

final class CareTaskNotFoundException implements Exception {
  const CareTaskNotFoundException(this.id);

  final String id;
}

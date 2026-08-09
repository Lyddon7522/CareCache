enum CareTaskKind { clean, inspect, replace, reorder, charge, custom }

class CareTask {
  const CareTask({
    required this.id,
    required this.title,
    required this.kind,
    required this.cadenceDays,
    required this.nextDueAt,
    required this.remindersEnabled,
    required this.reminderMinutesAfterMidnight,
    required this.createdAt,
    required this.updatedAt,
    this.deviceId,
    this.supplyId,
    this.lastCompletedAt,
    this.notes,
    this.archivedAt,
  });

  final String id;
  final String? deviceId;
  final String? supplyId;
  final String title;
  final CareTaskKind kind;
  final int cadenceDays;
  final DateTime nextDueAt;
  final DateTime? lastCompletedAt;
  final bool remindersEnabled;
  final int reminderMinutesAfterMidnight;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;

  bool isOverdueAt(DateTime date) => nextDueAt.isBefore(date);

  bool isDueBy(DateTime date) => !nextDueAt.isAfter(date);
}

class CareTaskDraft {
  const CareTaskDraft({
    required this.title,
    required this.kind,
    required this.cadenceDays,
    required this.nextDueAt,
    required this.remindersEnabled,
    required this.reminderMinutesAfterMidnight,
    this.deviceId,
    this.supplyId,
    this.notes,
  });

  final String? deviceId;
  final String? supplyId;
  final String title;
  final CareTaskKind kind;
  final int cadenceDays;
  final DateTime nextDueAt;
  final bool remindersEnabled;
  final int reminderMinutesAfterMidnight;
  final String? notes;
}

class TaskCompletion {
  const TaskCompletion({
    required this.id,
    required this.taskId,
    required this.completedAt,
    this.note,
  });

  final String id;
  final String taskId;
  final DateTime completedAt;
  final String? note;
}

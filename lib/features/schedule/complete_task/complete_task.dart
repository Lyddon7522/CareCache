import '../../../core/cqrs/mediator.dart';
import '../care_task.dart';
import '../reminder_scheduler.dart';
import '../schedule_store.dart';

final class CompleteTaskCommand implements Command<CareTask> {
  const CompleteTaskCommand(this.taskId, {this.completedAt, this.note});

  final String taskId;
  final DateTime? completedAt;
  final String? note;
}

final class CompleteTaskHandler implements CommandHandler<CompleteTaskCommand, CareTask> {
  const CompleteTaskHandler(this._store, this._reminders);

  final ScheduleStore _store;
  final ReminderScheduler _reminders;

  @override
  Future<CareTask> handle(CompleteTaskCommand command) async {
    final task = await _store.complete(
      command.taskId,
      completedAt: command.completedAt,
      note: command.note,
    );
    if (task.remindersEnabled) {
      await _reminders.schedule(task);
    }
    return task;
  }
}

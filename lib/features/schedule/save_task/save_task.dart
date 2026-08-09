import '../../../core/cqrs/mediator.dart';
import '../care_task.dart';
import '../reminder_scheduler.dart';
import '../schedule_store.dart';

final class SaveTaskCommand implements Command<String> {
  const SaveTaskCommand(this.draft, {this.taskId});

  final CareTaskDraft draft;
  final String? taskId;
}

final class SaveTaskHandler implements CommandHandler<SaveTaskCommand, String> {
  const SaveTaskHandler(this._store, this._reminders);

  final ScheduleStore _store;
  final ReminderScheduler _reminders;

  @override
  Future<String> handle(SaveTaskCommand command) async {
    final id = await _store.save(command.draft, id: command.taskId);
    final task = await _store.getTask(id);
    if (task != null && task.remindersEnabled) {
      await _reminders.schedule(task);
    } else {
      await _reminders.cancel(id);
    }
    return id;
  }
}

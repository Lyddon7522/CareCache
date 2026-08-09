import '../../../core/cqrs/mediator.dart';
import '../reminder_scheduler.dart';
import '../schedule_store.dart';

final class ArchiveTaskCommand implements Command<void> {
  const ArchiveTaskCommand(this.taskId);

  final String taskId;
}

final class ArchiveTaskHandler implements CommandHandler<ArchiveTaskCommand, void> {
  const ArchiveTaskHandler(this._store, this._reminders);

  final ScheduleStore _store;
  final ReminderScheduler _reminders;

  @override
  Future<void> handle(ArchiveTaskCommand command) async {
    await _store.archive(command.taskId);
    await _reminders.cancel(command.taskId);
  }
}

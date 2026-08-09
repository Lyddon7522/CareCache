import '../../../core/cqrs/mediator.dart';
import '../../schedule/reminder_scheduler.dart';
import '../../schedule/schedule_store.dart';
import '../backup_service.dart';

final class RestoreBackupCommand implements Command<void> {
  const RestoreBackupCommand(this.filePath);

  final String filePath;
}

final class RestoreBackupHandler implements CommandHandler<RestoreBackupCommand, void> {
  const RestoreBackupHandler(this._backups, this._scheduleStore, this._reminders);

  final CareCacheBackupService _backups;
  final ScheduleStore _scheduleStore;
  final ReminderScheduler _reminders;

  @override
  Future<void> handle(RestoreBackupCommand command) async {
    await _backups.restoreFile(command.filePath);
    final tasks = await _scheduleStore.watchTasks().first;
    await _reminders.synchronize(tasks);
  }
}

import '../../../core/cqrs/mediator.dart';
import '../reminder_scheduler.dart';

final class RequestReminderPermissionCommand implements Command<bool> {
  const RequestReminderPermissionCommand();
}

final class RequestReminderPermissionHandler
    implements CommandHandler<RequestReminderPermissionCommand, bool> {
  const RequestReminderPermissionHandler(this._reminders);

  final ReminderScheduler _reminders;

  @override
  Future<bool> handle(RequestReminderPermissionCommand command) {
    return _reminders.requestPermission();
  }
}

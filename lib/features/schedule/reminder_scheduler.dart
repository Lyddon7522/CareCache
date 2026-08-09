import 'care_task.dart';

abstract interface class ReminderScheduler {
  Future<void> initialize();

  Future<bool> requestPermission();

  Future<void> schedule(CareTask task);

  Future<void> cancel(String taskId);

  Future<void> synchronize(Iterable<CareTask> tasks);
}

final class NoopReminderScheduler implements ReminderScheduler {
  const NoopReminderScheduler();

  @override
  Future<void> initialize() async {}

  @override
  Future<bool> requestPermission() async => false;

  @override
  Future<void> schedule(CareTask task) async {}

  @override
  Future<void> cancel(String taskId) async {}

  @override
  Future<void> synchronize(Iterable<CareTask> tasks) async {}
}

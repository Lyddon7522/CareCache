import '../../../core/cqrs/mediator.dart';
import '../care_task.dart';
import '../schedule_store.dart';

final class WatchScheduleQuery implements Query<Stream<List<CareTask>>> {
  const WatchScheduleQuery();
}

final class WatchScheduleHandler
    implements QueryHandler<WatchScheduleQuery, Stream<List<CareTask>>> {
  const WatchScheduleHandler(this._store);

  final ScheduleStore _store;

  @override
  Stream<List<CareTask>> handle(WatchScheduleQuery query) => _store.watchTasks();
}

final class WatchTaskQuery implements Query<Stream<CareTask?>> {
  const WatchTaskQuery(this.taskId);

  final String taskId;
}

final class WatchTaskHandler implements QueryHandler<WatchTaskQuery, Stream<CareTask?>> {
  const WatchTaskHandler(this._store);

  final ScheduleStore _store;

  @override
  Stream<CareTask?> handle(WatchTaskQuery query) => _store.watchTask(query.taskId);
}

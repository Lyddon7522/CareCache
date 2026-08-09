import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../core/cqrs/mediator.dart';
import '../care_task.dart';
import '../complete_task/complete_task.dart';
import 'watch_schedule.dart';

final class ScheduleViewModel extends ChangeNotifier {
  ScheduleViewModel(this._mediator) {
    _subscription = _mediator
        .query(const WatchScheduleQuery())
        .listen(
          (tasks) {
            _tasks = tasks;
            _loading = false;
            _error = null;
            notifyListeners();
          },
          onError: (Object error) {
            _loading = false;
            _error = error;
            notifyListeners();
          },
        );
  }

  final Mediator _mediator;
  late final StreamSubscription<List<CareTask>> _subscription;
  List<CareTask> _tasks = const <CareTask>[];
  bool _loading = true;
  Object? _error;

  List<CareTask> get tasks => _tasks;
  bool get loading => _loading;
  Object? get error => _error;

  Future<void> complete(CareTask task) async {
    await _mediator.send<CareTask>(CompleteTaskCommand(task.id));
  }

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}

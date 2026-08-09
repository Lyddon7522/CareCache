import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../core/cqrs/mediator.dart';
import '../inventory/supply.dart';
import '../inventory/watch_inventory/watch_inventory.dart';
import '../schedule/care_task.dart';
import '../schedule/watch_schedule/watch_schedule.dart';

final class OverviewViewModel extends ChangeNotifier {
  OverviewViewModel(Mediator mediator) {
    _inventorySubscription = mediator.query(const WatchInventoryQuery()).listen(
      (supplies) {
        _supplies = supplies;
        _inventoryReady = true;
        notifyListeners();
      },
      onError: _onError,
    );
    _scheduleSubscription = mediator.query(const WatchScheduleQuery()).listen(
      (tasks) {
        _tasks = tasks;
        _scheduleReady = true;
        notifyListeners();
      },
      onError: _onError,
    );
  }

  late final StreamSubscription<List<SupplyItem>> _inventorySubscription;
  late final StreamSubscription<List<CareTask>> _scheduleSubscription;
  List<SupplyItem> _supplies = const <SupplyItem>[];
  List<CareTask> _tasks = const <CareTask>[];
  bool _inventoryReady = false;
  bool _scheduleReady = false;
  Object? _error;

  bool get loading => !_inventoryReady || !_scheduleReady;
  Object? get error => _error;
  bool get isEmpty => _supplies.isEmpty && _tasks.isEmpty;
  int get supplyCount => _supplies.length;
  int get scheduledTaskCount => _tasks.length;
  List<SupplyItem> get lowStock => _supplies.where((supply) => supply.isLowStock).toList();
  List<CareTask> get overdue => _tasks.where((task) => task.isOverdueAt(DateTime.now())).toList();
  int get attentionCount => lowStock.length + overdue.length;

  List<CareTask> get upcoming {
    final now = DateTime.now();
    final tasks = _tasks.where((task) => !task.isOverdueAt(now)).toList(growable: false)
      ..sort((left, right) => left.nextDueAt.compareTo(right.nextDueAt));
    return tasks.take(3).toList(growable: false);
  }

  bool get nothingNeedsAttention => lowStock.isEmpty && overdue.isEmpty;

  void _onError(Object error) {
    _error = error;
    _inventoryReady = true;
    _scheduleReady = true;
    notifyListeners();
  }

  @override
  void dispose() {
    unawaited(_inventorySubscription.cancel());
    unawaited(_scheduleSubscription.cancel());
    super.dispose();
  }
}

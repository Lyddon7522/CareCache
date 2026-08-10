import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../../core/cqrs/mediator.dart';
import '../adjust_inventory/adjust_inventory.dart';
import '../mark_supply_replaced/mark_supply_replaced.dart';
import '../supply.dart';
import 'watch_inventory.dart';

enum InventoryFilter { all, low, due }

final class InventoryViewModel extends ChangeNotifier {
  InventoryViewModel(this._mediator) {
    _subscription = _mediator
        .query(const WatchInventoryQuery())
        .listen(
          _onSupplies,
          onError: _onError,
        );
  }

  final Mediator _mediator;
  late final StreamSubscription<List<SupplyItem>> _subscription;
  List<SupplyItem> _supplies = const <SupplyItem>[];
  String _search = '';
  InventoryFilter _filter = InventoryFilter.all;
  bool _loading = true;
  Object? _error;

  bool get loading => _loading;
  Object? get error => _error;
  InventoryFilter get filter => _filter;
  int get totalCount => _supplies.length;
  int get lowStockCount => _supplies.where((supply) => supply.isLowStock).length;

  List<SupplyItem> get supplies {
    final now = DateTime.now();
    final normalizedSearch = _search.trim().toLowerCase();
    return _supplies
        .where((supply) {
          final matchesSearch =
              normalizedSearch.isEmpty ||
              supply.name.toLowerCase().contains(normalizedSearch) ||
              (supply.brand?.toLowerCase().contains(normalizedSearch) ?? false) ||
              (supply.barcode?.contains(normalizedSearch) ?? false);
          final matchesFilter = switch (_filter) {
            InventoryFilter.all => true,
            InventoryFilter.low => supply.isLowStock,
            InventoryFilter.due => supply.isReplacementDueBy(now),
          };
          return matchesSearch && matchesFilter;
        })
        .toList(growable: false);
  }

  void setSearch(String value) {
    if (_search == value) {
      return;
    }
    _search = value;
    notifyListeners();
  }

  void setFilter(InventoryFilter value) {
    if (_filter == value) {
      return;
    }
    _filter = value;
    notifyListeners();
  }

  Future<void> useOne(SupplyItem supply) {
    return _mediator.send<void>(
      AdjustInventoryCommand(
        supplyId: supply.id,
        delta: -1,
        kind: InventoryEventKind.used,
      ),
    );
  }

  Future<void> stockIn(SupplyItem supply) {
    return _mediator.send<void>(
      AdjustInventoryCommand(
        supplyId: supply.id,
        delta: 1,
        kind: InventoryEventKind.stockIn,
      ),
    );
  }

  Future<void> markReplaced(SupplyItem supply, {String? scannedBarcode}) {
    return _mediator.send<void>(
      MarkSupplyReplacedCommand(supply.id, scannedBarcode: scannedBarcode),
    );
  }

  void _onSupplies(List<SupplyItem> supplies) {
    _supplies = supplies;
    _loading = false;
    _error = null;
    notifyListeners();
  }

  void _onError(Object error) {
    _loading = false;
    _error = error;
    notifyListeners();
  }

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}

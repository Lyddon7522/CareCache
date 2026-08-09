import '../../../core/cqrs/mediator.dart';
import '../inventory_store.dart';
import '../supply.dart';

final class WatchInventoryQuery implements Query<Stream<List<SupplyItem>>> {
  const WatchInventoryQuery();
}

final class WatchInventoryHandler
    implements QueryHandler<WatchInventoryQuery, Stream<List<SupplyItem>>> {
  const WatchInventoryHandler(this._store);

  final InventoryStore _store;

  @override
  Stream<List<SupplyItem>> handle(WatchInventoryQuery query) => _store.watchSupplies();
}

final class WatchSupplyQuery implements Query<Stream<SupplyItem?>> {
  const WatchSupplyQuery(this.supplyId);

  final String supplyId;
}

final class WatchSupplyHandler implements QueryHandler<WatchSupplyQuery, Stream<SupplyItem?>> {
  const WatchSupplyHandler(this._store);

  final InventoryStore _store;

  @override
  Stream<SupplyItem?> handle(WatchSupplyQuery query) => _store.watchSupply(query.supplyId);
}

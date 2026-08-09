import '../../../core/cqrs/mediator.dart';
import '../inventory_store.dart';
import '../supply.dart';

final class FindSupplyByBarcodeQuery implements Query<Future<SupplyItem?>> {
  const FindSupplyByBarcodeQuery(this.barcode);

  final String barcode;
}

final class FindSupplyByBarcodeHandler
    implements QueryHandler<FindSupplyByBarcodeQuery, Future<SupplyItem?>> {
  const FindSupplyByBarcodeHandler(this._store);

  final InventoryStore _store;

  @override
  Future<SupplyItem?> handle(FindSupplyByBarcodeQuery query) {
    return _store.findByBarcode(query.barcode);
  }
}

import 'supply.dart';

abstract interface class InventoryStore {
  Stream<List<SupplyItem>> watchSupplies();

  Stream<SupplyItem?> watchSupply(String id);

  Future<SupplyItem?> findByBarcode(String barcode);

  Future<String> save(SupplyDraft draft, {String? id});

  Future<void> adjust(
    String supplyId,
    int requestedDelta, {
    required InventoryEventKind kind,
    String? note,
  });

  Future<void> markReplaced(String supplyId, {DateTime? replacedAt});

  Future<void> archive(String id);
}

final class DuplicateBarcodeException implements Exception {
  const DuplicateBarcodeException(this.barcode);

  final String barcode;
}

final class SupplyNotFoundException implements Exception {
  const SupplyNotFoundException(this.id);

  final String id;
}

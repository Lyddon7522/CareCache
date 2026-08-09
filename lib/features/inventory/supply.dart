enum SupplyCategory {
  cpap,
  respiratory,
  diabetes,
  woundCare,
  mobility,
  medicationAccessory,
  protective,
  diagnostic,
  nutrition,
  continence,
  other,
}

enum InventoryEventKind { stockIn, used, adjustment, replacement }

class SupplyItem {
  const SupplyItem({
    required this.id,
    required this.name,
    required this.category,
    required this.unitLabel,
    required this.quantityOnHand,
    required this.reorderPoint,
    required this.createdAt,
    required this.updatedAt,
    this.deviceId,
    this.brand,
    this.modelNumber,
    this.barcode,
    this.lotNumber,
    this.expirationDate,
    this.replacementCadenceDays,
    this.lastReplacedAt,
    this.nextReplacementAt,
    this.storageLocation,
    this.notes,
    this.imagePath,
    this.archivedAt,
  });

  final String id;
  final String? deviceId;
  final String name;
  final SupplyCategory category;
  final String? brand;
  final String? modelNumber;
  final String? barcode;
  final String? lotNumber;
  final DateTime? expirationDate;
  final String unitLabel;
  final int quantityOnHand;
  final int reorderPoint;
  final int? replacementCadenceDays;
  final DateTime? lastReplacedAt;
  final DateTime? nextReplacementAt;
  final String? storageLocation;
  final String? notes;
  final String? imagePath;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;

  bool get isLowStock => quantityOnHand <= reorderPoint;

  bool isExpiredAt(DateTime date) {
    final expiration = expirationDate;
    return expiration != null && expiration.isBefore(date);
  }

  bool isReplacementDueBy(DateTime date) {
    final next = nextReplacementAt;
    return next != null && !next.isAfter(date);
  }
}

class SupplyDraft {
  const SupplyDraft({
    required this.name,
    required this.category,
    required this.unitLabel,
    required this.quantityOnHand,
    required this.reorderPoint,
    this.deviceId,
    this.brand,
    this.modelNumber,
    this.barcode,
    this.lotNumber,
    this.expirationDate,
    this.replacementCadenceDays,
    this.lastReplacedAt,
    this.nextReplacementAt,
    this.storageLocation,
    this.notes,
    this.imagePath,
  });

  final String? deviceId;
  final String name;
  final SupplyCategory category;
  final String? brand;
  final String? modelNumber;
  final String? barcode;
  final String? lotNumber;
  final DateTime? expirationDate;
  final String unitLabel;
  final int quantityOnHand;
  final int reorderPoint;
  final int? replacementCadenceDays;
  final DateTime? lastReplacedAt;
  final DateTime? nextReplacementAt;
  final String? storageLocation;
  final String? notes;
  final String? imagePath;
}

class InventoryEvent {
  const InventoryEvent({
    required this.id,
    required this.supplyId,
    required this.kind,
    required this.delta,
    required this.occurredAt,
    this.note,
  });

  final String id;
  final String supplyId;
  final InventoryEventKind kind;
  final int delta;
  final DateTime occurredAt;
  final String? note;
}

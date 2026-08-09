enum DeviceCategory {
  cpap,
  oxygen,
  nebulizer,
  glucoseMeter,
  bloodPressureMonitor,
  mobilityAid,
  infusion,
  other,
}

class MedicalDevice {
  const MedicalDevice({
    required this.id,
    required this.name,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    this.manufacturer,
    this.modelNumber,
    this.serialNumber,
    this.installedAt,
    this.warrantyExpiresAt,
    this.supplier,
    this.manualUrl,
    this.storageLocation,
    this.prescriptionMode,
    this.pressureMin,
    this.pressureMax,
    this.pressureUnit,
    this.humidifierSetting,
    this.rampMinutes,
    this.prescribedBy,
    this.prescribedAt,
    this.prescriptionNotes,
    this.notes,
    this.archivedAt,
  });

  final String id;
  final String name;
  final DeviceCategory category;
  final String? manufacturer;
  final String? modelNumber;
  final String? serialNumber;
  final DateTime? installedAt;
  final DateTime? warrantyExpiresAt;
  final String? supplier;
  final String? manualUrl;
  final String? storageLocation;
  final String? prescriptionMode;
  final double? pressureMin;
  final double? pressureMax;
  final String? pressureUnit;
  final String? humidifierSetting;
  final int? rampMinutes;
  final String? prescribedBy;
  final DateTime? prescribedAt;
  final String? prescriptionNotes;
  final String? notes;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? archivedAt;
}

class DeviceDraft {
  const DeviceDraft({
    required this.name,
    required this.category,
    this.manufacturer,
    this.modelNumber,
    this.serialNumber,
    this.installedAt,
    this.warrantyExpiresAt,
    this.supplier,
    this.manualUrl,
    this.storageLocation,
    this.prescriptionMode,
    this.pressureMin,
    this.pressureMax,
    this.pressureUnit,
    this.humidifierSetting,
    this.rampMinutes,
    this.prescribedBy,
    this.prescribedAt,
    this.prescriptionNotes,
    this.notes,
  });

  final String name;
  final DeviceCategory category;
  final String? manufacturer;
  final String? modelNumber;
  final String? serialNumber;
  final DateTime? installedAt;
  final DateTime? warrantyExpiresAt;
  final String? supplier;
  final String? manualUrl;
  final String? storageLocation;
  final String? prescriptionMode;
  final double? pressureMin;
  final double? pressureMax;
  final String? pressureUnit;
  final String? humidifierSetting;
  final int? rampMinutes;
  final String? prescribedBy;
  final DateTime? prescribedAt;
  final String? prescriptionNotes;
  final String? notes;
}

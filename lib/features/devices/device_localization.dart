import '../../l10n/app_localizations.dart';
import 'device.dart';

extension DeviceCategoryLocalization on DeviceCategory {
  String label(AppLocalizations l10n) => switch (this) {
    DeviceCategory.cpap => l10n.deviceCpap,
    DeviceCategory.oxygen => l10n.deviceOxygen,
    DeviceCategory.nebulizer => l10n.deviceNebulizer,
    DeviceCategory.glucoseMeter => l10n.deviceGlucoseMeter,
    DeviceCategory.bloodPressureMonitor => l10n.deviceBloodPressureMonitor,
    DeviceCategory.mobilityAid => l10n.deviceMobilityAid,
    DeviceCategory.infusion => l10n.deviceInfusion,
    DeviceCategory.other => l10n.deviceOther,
  };
}

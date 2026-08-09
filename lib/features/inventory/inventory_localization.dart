import '../../l10n/app_localizations.dart';
import 'supply.dart';

extension SupplyCategoryLocalization on SupplyCategory {
  String label(AppLocalizations l10n) => switch (this) {
    SupplyCategory.cpap => l10n.categoryCpap,
    SupplyCategory.respiratory => l10n.categoryRespiratory,
    SupplyCategory.diabetes => l10n.categoryDiabetes,
    SupplyCategory.woundCare => l10n.categoryWoundCare,
    SupplyCategory.mobility => l10n.categoryMobility,
    SupplyCategory.medicationAccessory => l10n.categoryMedicationAccessory,
    SupplyCategory.protective => l10n.categoryProtective,
    SupplyCategory.diagnostic => l10n.categoryDiagnostic,
    SupplyCategory.nutrition => l10n.categoryNutrition,
    SupplyCategory.continence => l10n.categoryContinence,
    SupplyCategory.other => l10n.categoryOther,
  };
}

import '../../l10n/app_localizations.dart';
import 'care_task.dart';

extension CareTaskKindLocalization on CareTaskKind {
  String label(AppLocalizations l10n) => switch (this) {
    CareTaskKind.clean => l10n.taskClean,
    CareTaskKind.inspect => l10n.taskInspect,
    CareTaskKind.replace => l10n.taskReplace,
    CareTaskKind.reorder => l10n.taskReorder,
    CareTaskKind.charge => l10n.taskCharge,
    CareTaskKind.custom => l10n.taskCustom,
  };
}

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../l10n/app_localizations.dart';

extension CareLocalizations on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);

  String careDate(DateTime value) =>
      DateFormat.yMMMd(Localizations.localeOf(this).toString()).format(
        value.toLocal(),
      );
}

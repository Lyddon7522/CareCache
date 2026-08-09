import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import '../core/theme/care_theme.dart';
import '../features/settings/appearance.dart';
import '../features/settings/change_appearance/change_appearance.dart';
import '../l10n/app_localizations.dart';
import 'app_dependencies.dart';
import 'app_router.dart';

class CareCacheApp extends StatefulWidget {
  const CareCacheApp({required this.dependencies, super.key});

  final AppDependencies dependencies;

  @override
  State<CareCacheApp> createState() => _CareCacheAppState();
}

class _CareCacheAppState extends State<CareCacheApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = createAppRouter(widget.dependencies.mediator);
  }

  @override
  void dispose() {
    _router.dispose();
    widget.dependencies.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CareAppearance>(
      stream: widget.dependencies.mediator.query(const WatchAppearanceQuery()),
      initialData: CareAppearance.system,
      builder: (context, snapshot) {
        final appearance = snapshot.data ?? CareAppearance.system;
        return MaterialApp.router(
          onGenerateTitle: (context) => AppLocalizations.of(context).appName,
          debugShowCheckedModeBanner: false,
          theme: CareTheme.light(),
          darkTheme: CareTheme.dark(),
          themeMode: switch (appearance) {
            CareAppearance.system => ThemeMode.system,
            CareAppearance.light => ThemeMode.light,
            CareAppearance.dark => ThemeMode.dark,
          },
          localizationsDelegates: const <LocalizationsDelegate<Object>>[
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          routerConfig: _router,
        );
      },
    );
  }
}

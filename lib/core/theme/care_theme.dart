import 'package:flutter/material.dart';

abstract final class CareColors {
  static const Color primary = Color(0xFF4A4FC4);
  static const Color primaryStrong = Color(0xFF30358F);
  static const Color primarySoft = Color(0xFFE5E7FF);
  static const Color coral = Color(0xFFC64B64);
  static const Color canvas = Color(0xFFF8F8FD);
  static const Color ink = Color(0xFF22243A);
  static const Color muted = Color(0xFF63667A);
  static const Color border = Color(0xFFDFE0EC);
  static const Color darkCanvas = Color(0xFF11121E);
  static const Color darkSurface = Color(0xFF1A1C2B);
}

abstract final class CareTheme {
  static ThemeData light() {
    const scheme = ColorScheme(
      brightness: Brightness.light,
      primary: CareColors.primary,
      onPrimary: Colors.white,
      primaryContainer: CareColors.primarySoft,
      onPrimaryContainer: CareColors.primaryStrong,
      secondary: CareColors.coral,
      onSecondary: Colors.white,
      secondaryContainer: Color(0xFFFFE0E7),
      onSecondaryContainer: Color(0xFF671327),
      tertiary: Color(0xFF5E5C73),
      onTertiary: Colors.white,
      tertiaryContainer: Color(0xFFE7E3F0),
      onTertiaryContainer: Color(0xFF292638),
      error: Color(0xFFBA1A1A),
      onError: Colors.white,
      errorContainer: Color(0xFFFFDAD6),
      onErrorContainer: Color(0xFF410002),
      surface: Colors.white,
      onSurface: CareColors.ink,
      surfaceContainerHighest: Color(0xFFECECF4),
      onSurfaceVariant: CareColors.muted,
      outline: Color(0xFF7A7D91),
      outlineVariant: CareColors.border,
      shadow: Color(0x1A22243A),
      scrim: Color(0x66000000),
      inverseSurface: Color(0xFF2E3045),
      onInverseSurface: Color(0xFFF2F1FA),
      inversePrimary: Color(0xFFB9C0FF),
    );
    return _base(scheme).copyWith(scaffoldBackgroundColor: CareColors.canvas);
  }

  static ThemeData dark() {
    const scheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFB9C0FF),
      onPrimary: Color(0xFF20246B),
      primaryContainer: Color(0xFF343A86),
      onPrimaryContainer: Color(0xFFE3E5FF),
      secondary: Color(0xFFFFB1C1),
      onSecondary: Color(0xFF650025),
      secondaryContainer: Color(0xFF84223B),
      onSecondaryContainer: Color(0xFFFFD9E1),
      tertiary: Color(0xFFC9C4DB),
      onTertiary: Color(0xFF302D40),
      tertiaryContainer: Color(0xFF474355),
      onTertiaryContainer: Color(0xFFE5E0F7),
      error: Color(0xFFFFB4AB),
      onError: Color(0xFF690005),
      errorContainer: Color(0xFF93000A),
      onErrorContainer: Color(0xFFFFDAD6),
      surface: CareColors.darkSurface,
      onSurface: Color(0xFFE8E8F2),
      surfaceContainerHighest: Color(0xFF292B3C),
      onSurfaceVariant: Color(0xFFC6C5D2),
      outline: Color(0xFF9091A4),
      outlineVariant: Color(0xFF414354),
      shadow: Colors.black,
      scrim: Color(0xAA000000),
      inverseSurface: Color(0xFFE8E8F2),
      onInverseSurface: Color(0xFF2B2D3E),
      inversePrimary: CareColors.primary,
    );
    return _base(scheme).copyWith(scaffoldBackgroundColor: CareColors.darkCanvas);
  }

  static ThemeData _base(ColorScheme scheme) {
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      visualDensity: VisualDensity.standard,
    );
    const radius = BorderRadius.all(Radius.circular(20));
    return base.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        elevation: 0,
        titleTextStyle: base.textTheme.titleLarge?.copyWith(
          color: scheme.onSurface,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
      ),
      cardTheme: CardThemeData(
        color: scheme.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(48, 48),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          side: BorderSide(color: scheme.outlineVariant),
          textStyle: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surface,
        elevation: 0,
        indicatorColor: scheme.primaryContainer,
        labelTextStyle: WidgetStatePropertyAll<TextStyle>(
          base.textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: scheme.surface,
        indicatorColor: scheme.primaryContainer,
        selectedLabelTextStyle: base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
      ),
      dividerTheme: DividerThemeData(color: scheme.outlineVariant),
    );
  }
}

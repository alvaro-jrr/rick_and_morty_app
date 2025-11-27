import "package:flutter/material.dart";

class AppTheme {
  final TextTheme? textTheme;

  const AppTheme([this.textTheme]);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff576422),
      surfaceTint: Color(0xff576422),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffdaea98),
      onPrimaryContainer: Color(0xff3f4c0a),
      secondary: Color(0xff5c6146),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe1e6c3),
      onSecondaryContainer: Color(0xff444930),
      tertiary: Color(0xff3a665d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbdece0),
      onTertiaryContainer: Color(0xff214e46),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xff1b1c15),
      onSurfaceVariant: Color(0xff46483c),
      outline: Color(0xff77786a),
      outlineVariant: Color(0xffc7c8b8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303129),
      inversePrimary: Color(0xffbece7f),
      primaryFixed: Color(0xffdaea98),
      onPrimaryFixed: Color(0xff181e00),
      primaryFixedDim: Color(0xffbece7f),
      onPrimaryFixedVariant: Color(0xff3f4c0a),
      secondaryFixed: Color(0xffe1e6c3),
      onSecondaryFixed: Color(0xff191d08),
      secondaryFixedDim: Color(0xffc5caa8),
      onSecondaryFixedVariant: Color(0xff444930),
      tertiaryFixed: Color(0xffbdece0),
      onTertiaryFixed: Color(0xff00201b),
      tertiaryFixedDim: Color(0xffa1d0c4),
      onTertiaryFixedVariant: Color(0xff214e46),
      surfaceDim: Color(0xffdbdbce),
      surfaceBright: Color(0xfffbfaed),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f4e8),
      surfaceContainer: Color(0xffefeee2),
      surfaceContainerHigh: Color(0xffeae9dc),
      surfaceContainerHighest: Color(0xffe4e3d7),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff303b00),
      surfaceTint: Color(0xff576422),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff65732f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff343820),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6b7053),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff0c3d35),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff49756c),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbfaed),
      onSurface: Color(0xff11120b),
      onSurfaceVariant: Color(0xff35372c),
      outline: Color(0xff525447),
      outlineVariant: Color(0xff6d6e61),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303129),
      inversePrimary: Color(0xffbece7f),
      primaryFixed: Color(0xff65732f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff4d5a18),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6b7053),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff52573d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff49756c),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff305d53),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc8c7bb),
      surfaceBright: Color(0xfffbfaed),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff5f4e8),
      surfaceContainer: Color(0xffeae9dc),
      surfaceContainerHigh: Color(0xffdeddd1),
      surfaceContainerHighest: Color(0xffd3d2c6),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff273000),
      surfaceTint: Color(0xff576422),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff424e0d),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2a2e17),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff474c32),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00332b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff245148),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffbfaed),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2b2d22),
      outlineVariant: Color(0xff484a3e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff303129),
      inversePrimary: Color(0xffbece7f),
      primaryFixed: Color(0xff424e0d),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff2c3700),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff474c32),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff30351d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff245148),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff073a32),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbab9ae),
      surfaceBright: Color(0xfffbfaed),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f1e5),
      surfaceContainer: Color(0xffe4e3d7),
      surfaceContainerHigh: Color(0xffd6d5c9),
      surfaceContainerHighest: Color(0xffc8c7bb),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbece7f),
      surfaceTint: Color(0xffbece7f),
      onPrimary: Color(0xff2a3400),
      primaryContainer: Color(0xff3f4c0a),
      onPrimaryContainer: Color(0xffdaea98),
      secondary: Color(0xffc5caa8),
      onSecondary: Color(0xff2e331b),
      secondaryContainer: Color(0xff444930),
      onSecondaryContainer: Color(0xffe1e6c3),
      tertiary: Color(0xffa1d0c4),
      onTertiary: Color(0xff04372f),
      tertiaryContainer: Color(0xff214e46),
      onTertiaryContainer: Color(0xffbdece0),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff13140d),
      onSurface: Color(0xffe4e3d7),
      onSurfaceVariant: Color(0xffc7c8b8),
      outline: Color(0xff919283),
      outlineVariant: Color(0xff46483c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e3d7),
      inversePrimary: Color(0xff576422),
      primaryFixed: Color(0xffdaea98),
      onPrimaryFixed: Color(0xff181e00),
      primaryFixedDim: Color(0xffbece7f),
      onPrimaryFixedVariant: Color(0xff3f4c0a),
      secondaryFixed: Color(0xffe1e6c3),
      onSecondaryFixed: Color(0xff191d08),
      secondaryFixedDim: Color(0xffc5caa8),
      onSecondaryFixedVariant: Color(0xff444930),
      tertiaryFixed: Color(0xffbdece0),
      onTertiaryFixed: Color(0xff00201b),
      tertiaryFixedDim: Color(0xffa1d0c4),
      onTertiaryFixedVariant: Color(0xff214e46),
      surfaceDim: Color(0xff13140d),
      surfaceBright: Color(0xff393a31),
      surfaceContainerLowest: Color(0xff0e0f08),
      surfaceContainerLow: Color(0xff1b1c15),
      surfaceContainer: Color(0xff1f2019),
      surfaceContainerHigh: Color(0xff2a2b23),
      surfaceContainerHighest: Color(0xff34352d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd4e493),
      surfaceTint: Color(0xffbece7f),
      onPrimary: Color(0xff212900),
      primaryContainer: Color(0xff89974f),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffdbdfbd),
      onSecondary: Color(0xff232811),
      secondaryContainer: Color(0xff8e9475),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb7e6da),
      onTertiary: Color(0xff002c25),
      tertiaryContainer: Color(0xff6c998f),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff13140d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffddddcd),
      outline: Color(0xffb2b3a3),
      outlineVariant: Color(0xff909183),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e3d7),
      inversePrimary: Color(0xff414d0b),
      primaryFixed: Color(0xffdaea98),
      onPrimaryFixed: Color(0xff0e1300),
      primaryFixedDim: Color(0xffbece7f),
      onPrimaryFixedVariant: Color(0xff303b00),
      secondaryFixed: Color(0xffe1e6c3),
      onSecondaryFixed: Color(0xff0f1302),
      secondaryFixedDim: Color(0xffc5caa8),
      onSecondaryFixedVariant: Color(0xff343820),
      tertiaryFixed: Color(0xffbdece0),
      onTertiaryFixed: Color(0xff001511),
      tertiaryFixedDim: Color(0xffa1d0c4),
      onTertiaryFixedVariant: Color(0xff0c3d35),
      surfaceDim: Color(0xff13140d),
      surfaceBright: Color(0xff44453c),
      surfaceContainerLowest: Color(0xff070803),
      surfaceContainerLow: Color(0xff1d1e17),
      surfaceContainer: Color(0xff272921),
      surfaceContainerHigh: Color(0xff32332b),
      surfaceContainerHighest: Color(0xff3d3e36),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe8f8a5),
      surfaceTint: Color(0xffbece7f),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbaca7c),
      onPrimaryContainer: Color(0xff090d00),
      secondary: Color(0xffeef3d0),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc1c6a5),
      onSecondaryContainer: Color(0xff090d00),
      tertiary: Color(0xffcafaee),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff9dccc0),
      onTertiaryContainer: Color(0xff000e0b),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff13140d),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff1f1e0),
      outlineVariant: Color(0xffc3c4b4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe4e3d7),
      inversePrimary: Color(0xff414d0b),
      primaryFixed: Color(0xffdaea98),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffbece7f),
      onPrimaryFixedVariant: Color(0xff0e1300),
      secondaryFixed: Color(0xffe1e6c3),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffc5caa8),
      onSecondaryFixedVariant: Color(0xff0f1302),
      tertiaryFixed: Color(0xffbdece0),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa1d0c4),
      onTertiaryFixedVariant: Color(0xff001511),
      surfaceDim: Color(0xff13140d),
      surfaceBright: Color(0xff505148),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1f2019),
      surfaceContainer: Color(0xff303129),
      surfaceContainerHigh: Color(0xff3b3c33),
      surfaceContainerHighest: Color(0xff47473e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme?.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    appBarTheme: AppBarThemeData(
      backgroundColor: colorScheme.inverseSurface,
      foregroundColor: colorScheme.onInverseSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {TargetPlatform.android: ZoomPageTransitionsBuilder()},
    ),
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

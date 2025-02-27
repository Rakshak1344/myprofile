import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static const Color scaffoldBackground = Color(0xfff2f2f2);

  // Background Colors
  static const Color background = Colors.white;// Color(0xFFF0F6FF);
  static const Color onBackground = Color(0xFF1A1A1A);

  // Primary Colors
  static const Color primary = Color(0xFF01295C);
  static const Color onPrimary = Colors.white;
  static const Color primaryContainer = Color(0xFFEEF4FF); // Color(0xFF025ED4);
  static const Color onPrimaryContainer = Color(0xFF01295C);

  // Secondary Colors
  static const Color secondary = Color(0xFFFF681E);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFFFCCB2);
  static const Color secondaryContainerTint = Color(0xFFFFF5F0);
  static const Color onSecondaryContainer = Color(0xFFCC4300);

  // Tertiary Colors
  static const Color tertiary = Colors.grey;
  static const Color onTertiary = Colors.white;
  static const Color tertiaryContainer = Colors.grey;
  static const Color onTertiaryContainer = Colors.grey;

  // Outline Colors
  static const Color outline = Color(0xFFC4C4C4);

  // Error Colors
  static const Color error = Color(0xFFCC0000);
  static const Color onError = Colors.white;
  static const Color errorContainer = Color(0xFFFFCCCC);
  static const Color onErrorContainer = Color(0xFF800000);

  // Surface Colors
  static const Color surface = Colors.white;
  static const Color onSurface = Color(0xFF1A1A1A);
  static const Color surfaceVariant = Color(0XFFF2F2F2);
  static const Color onSurfaceVariant = Color(0xFF6E6E6E);

  static const Color green = Color(0xFF00A911);
  static const Color yellow = Colors.amberAccent;
  static const Color bannerBackground = Color(0xFFC2E0FF);

  static const ColorScheme light = ColorScheme.light(
    // Brightness
    brightness: Brightness.light,

    // Background Colors
    background: background,
    onBackground: onBackground,

    // Surface Colors
    surface: surface,
    onSurface: onSurface,
    surfaceVariant: surfaceVariant,
    onSurfaceVariant: onSurfaceVariant,

    surfaceTint: secondaryContainer,
    // inverseSurface: inverseSurface,
    // onInverseSurface: onInverseSurface,

    // Primary Colors
    primary: primary,
    // inversePrimary: inversePrimary,
    onPrimary: onPrimary,
    primaryContainer: primaryContainer,
    onPrimaryContainer: onPrimaryContainer,

    // Secondary Colors
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondaryContainer,
    onSecondaryContainer: onSecondaryContainer,

    // Tertiary Colors
    tertiary: tertiary,
    onTertiary: onTertiary,
    tertiaryContainer: tertiaryContainer,
    onTertiaryContainer: onTertiaryContainer,

    // Error Colors
    error: error,
    onError: onError,
    errorContainer: errorContainer,
    onErrorContainer: onErrorContainer,

    // Outline Colors
    outline: outline,
    // outlineVariant: outlineVariant,

    // Other Colors
    // scrim: scrim,
    // shadow: shadow,
  );

  static ColorScheme dark = light.copyWith(
    brightness: Brightness.dark,
  );

  /* Colors are reversed for indipe consumer */
  static ColorScheme consumerLight = light.copyWith(
    primary: secondary,
    onPrimary: onSecondary,
    primaryContainer: secondaryContainer,
    onPrimaryContainer: onSecondaryContainer,
    secondary: primary,
    onSecondary: onPrimary,
    secondaryContainer: primaryContainer,
    onSecondaryContainer: secondaryContainer,
  );
}

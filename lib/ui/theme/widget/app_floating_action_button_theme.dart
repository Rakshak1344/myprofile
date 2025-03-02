import 'package:flutter/material.dart';

class AppFloatingActionButtonTheme {
  static FloatingActionButtonThemeData floatingActionButtonThemeData(
    ThemeData themeData,
  ) {
    return FloatingActionButtonThemeData(
      foregroundColor: themeData.colorScheme.surface,
      backgroundColor: themeData.colorScheme.primary,
      extendedTextStyle: themeData.textTheme.titleMedium,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

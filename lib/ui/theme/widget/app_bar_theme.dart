import 'package:flutter/material.dart';

class AppBarThemeData {
  static AppBarTheme light(ThemeData themeData) {
    return AppBarTheme(
      elevation: 8,
      shadowColor: themeData.colorScheme.surface,
      surfaceTintColor: themeData.colorScheme.surface,
      titleTextStyle: themeData.textTheme.titleLarge?.copyWith(
        color: themeData.colorScheme.primary,
      ),
    );
  }
}

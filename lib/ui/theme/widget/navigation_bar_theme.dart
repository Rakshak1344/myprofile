import 'package:flutter/material.dart';

class AppNavBarTheme {
  static NavigationBarThemeData getTheme(ThemeData themeData) {
    return NavigationBarThemeData(
      backgroundColor: themeData.colorScheme.surface,
      surfaceTintColor: themeData.colorScheme.surface,
      indicatorColor: themeData.colorScheme.primary,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => themeData.textTheme.labelSmall?.copyWith(
          color: states.contains(WidgetState.selected)
              ? themeData.colorScheme.primary
              : themeData.colorScheme.onSurface,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected)
              ? themeData.colorScheme.onPrimary
              : themeData.colorScheme.onSurface,
        ),
      ),
    );
  }
}

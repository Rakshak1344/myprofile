import 'package:flutter/material.dart';

class AppNavBarTheme {
  static NavigationBarThemeData getTheme(ThemeData themeData) {
    return NavigationBarThemeData(
      backgroundColor: themeData.colorScheme.surface,
      surfaceTintColor: themeData.colorScheme.surface,
      indicatorColor: themeData.colorScheme.primary,
      labelTextStyle: MaterialStateProperty.resolveWith(
        (states) => themeData.textTheme.labelSmall?.copyWith(
          color: states.contains(MaterialState.selected)
              ? themeData.colorScheme.primary
              : themeData.colorScheme.onSurface,
        ),
      ),
      iconTheme: MaterialStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(MaterialState.selected)
              ? themeData.colorScheme.onPrimary
              : themeData.colorScheme.onSurface,
        ),
      ),
    );
  }
}

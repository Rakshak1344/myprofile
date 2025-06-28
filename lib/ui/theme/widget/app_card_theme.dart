import 'package:flutter/material.dart';

class AppCardTheme {
  static CardThemeData light(ThemeData themeData) {
    return CardThemeData(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      color: themeData.colorScheme.surface,
      shadowColor:
          themeData.colorScheme.primaryContainer.withValues(alpha: 0.3),
      surfaceTintColor: themeData.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // margin: const EdgeInsets.all(12),
    );
  }

  static CardThemeData dark(ThemeData themeData) {
    return themeData.copyWith().cardTheme;
  }
}

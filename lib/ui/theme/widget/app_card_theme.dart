import 'package:flutter/material.dart';

class AppCardTheme {
  static CardTheme light(ThemeData themeData) {
    return CardTheme(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      color: themeData.colorScheme.surface,
      shadowColor: themeData.colorScheme.primaryContainer.withOpacity(0.3),
      surfaceTintColor: themeData.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      // margin: const EdgeInsets.all(12),
    );
  }

  static CardThemeData dark(ThemeData themeData) {
    return themeData.copyWith().cardTheme;
  }
}

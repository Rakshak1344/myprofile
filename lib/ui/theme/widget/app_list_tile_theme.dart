import 'package:flutter/material.dart';

class AppListTileTheme {
  static ListTileThemeData light(ThemeData themeData) {
    var color = themeData.colorScheme;

    return ListTileThemeData(
      iconColor: color.primary,
      textColor: color.onSurface,
    );
  }

  static ListTileThemeData dark(ThemeData themeData) {
    return themeData.copyWith().listTileTheme;
  }
}

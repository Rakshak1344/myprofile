import 'package:flutter/material.dart';

class AppDividerTheme {
  static DividerThemeData light(ThemeData themeData) {
    return DividerThemeData(
      color: themeData.colorScheme.surfaceContainerHighest,
      thickness: 2,
      indent: 22,
      endIndent: 22,
    );
  }
}

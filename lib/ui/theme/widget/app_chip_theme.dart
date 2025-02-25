import 'package:flutter/material.dart';

class AppChipTheme {
  static ChipThemeData light(ThemeData themeData) {
    return ChipThemeData(
      showCheckmark: false,
      selectedColor: themeData.colorScheme.secondary,
      shape: const StadiumBorder(),
      side: BorderSide(color: themeData.colorScheme.primary),
    );
  }
}

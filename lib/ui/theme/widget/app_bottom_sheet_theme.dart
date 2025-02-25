import 'package:flutter/material.dart';

class AppBottomSheetTheme {
  static BottomSheetThemeData light(ThemeData themeData) {
    return const BottomSheetThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      elevation: 4,
      modalElevation: 4,
    );
  }

  static BottomSheetThemeData dark(ThemeData themeData) {
    return themeData.copyWith().bottomSheetTheme;
  }
}

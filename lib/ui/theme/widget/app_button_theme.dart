import 'package:flutter/material.dart';

class AppButtonTheme {
  static ElevatedButtonThemeData elevatedButton(ThemeData themeData) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: _buttonBorder(),
        padding: _buttonPadding(),
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  static FilledButtonThemeData filledButton(ThemeData themeData) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: _buttonBorder(),
        padding: _buttonPadding(),
        textStyle: _textStyle(),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  static EdgeInsets _buttonPadding() => const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 12,
      );

  static RoundedRectangleBorder _buttonBorder() =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10));

  static OutlinedButtonThemeData outlinedButton(ThemeData themeData) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: themeData.colorScheme.primary,
        padding: _buttonPadding(),
        shape: _buttonBorder(),
        side: BorderSide(
          style: BorderStyle.solid,
          color: themeData.colorScheme.primary,
          width: 2,
        ),
        textStyle: themeData.textTheme.titleMedium!.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static IconButtonThemeData iconButton(ThemeData themeData) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: themeData.colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }

  static TextButtonThemeData textButton(ThemeData themeData) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textStyle: themeData.textTheme.titleMedium!.copyWith(
          color: themeData.colorScheme.primary,
        ),
      ),
    );
  }

  static TextStyle _textStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14,
    );
  }
}

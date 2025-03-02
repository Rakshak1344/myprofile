import 'package:flutter/material.dart';

class AppInputDecorationTheme {
  static BorderSide _borderSide(Color color) {
    return BorderSide(
      color: color,
      width: 1.5,
      style: BorderStyle.solid,
      strokeAlign: BorderSide.strokeAlignOutside,
    );
  }

  static OutlineInputBorder _outlineBorder(ThemeData themeData) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: _borderSide(themeData.colorScheme.onSurface),
    );
  }

  static OutlineInputBorder _enableOutlineBorder(ThemeData themeData) {
    return _outlineBorder(themeData).copyWith(
      borderSide: _borderSide(themeData.colorScheme.tertiary),
    );
  }

  static OutlineInputBorder _focusedOutlineBorder(ThemeData themeData) {
    return _outlineBorder(themeData).copyWith(
      borderSide: _borderSide(themeData.colorScheme.primary),
    );
  }

  static OutlineInputBorder _errorOutlineBorder(ThemeData themeData) {
    return _outlineBorder(themeData).copyWith(
      borderSide: _borderSide(themeData.colorScheme.error),
    );
  }

  static OutlineInputBorder _disabledOutlineBorder(ThemeData themeData) {
    return _outlineBorder(themeData).copyWith(
      borderSide: BorderSide(color: themeData.colorScheme.tertiary),
    );
  }

  static InputDecorationTheme light(ThemeData themeData) {
    return InputDecorationTheme(
      contentPadding: const EdgeInsets.only(left: 18),
      border: _outlineBorder(themeData),
      iconColor: themeData.colorScheme.primary,
      prefixIconColor: themeData.colorScheme.onSurface,
      suffixIconColor: themeData.colorScheme.onSurface,
      enabledBorder: _enableOutlineBorder(themeData),
      errorBorder: _errorOutlineBorder(themeData),
      disabledBorder: _disabledOutlineBorder(themeData),
      focusedBorder: _focusedOutlineBorder(themeData),
      focusedErrorBorder: _errorOutlineBorder(themeData),
      labelStyle: themeData.textTheme.titleMedium,
      hintStyle: themeData.textTheme.titleMedium!.copyWith(
        color: themeData.colorScheme.tertiary,
      ),
      errorStyle: themeData.textTheme.labelSmall!.copyWith(
        color: themeData.colorScheme.error,
      ),
    );
  }

  static InputDecorationTheme phoneNumberInputDecoration(ThemeData themeData) {
    return InputDecorationTheme(
      isDense: true,
      filled: true,
      fillColor: themeData.colorScheme.tertiary.withOpacity(0.2),
      enabledBorder: _filledOutlineInputBorder(),
      focusedBorder: _filledOutlineInputBorder(),
      errorBorder: _filledOutlineErrorInputBorder(themeData),
      focusedErrorBorder: _filledOutlineErrorInputBorder(themeData),
      border: _filledOutlineInputBorder(),
      labelStyle: themeData.textTheme.headlineSmall!
          .copyWith(color: themeData.colorScheme.primary),
    );
  }

  static OutlineInputBorder _filledOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(width: 0, style: BorderStyle.none),
    );
  }

  static OutlineInputBorder _filledOutlineErrorInputBorder(
    ThemeData themeData,
  ) {
    return _filledOutlineInputBorder().copyWith(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: themeData.colorScheme.error,
      ),
    );
  }
}

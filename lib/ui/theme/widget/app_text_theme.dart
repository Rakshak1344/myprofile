import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static TextTheme light() {
    return GoogleFonts.montserratTextTheme(
      // TextTheme with sane values
      TextTheme(
        // displayLarge: displayLarge,
        // displayMedium: displayMedium,
        // displaySmall: displaySmall,
        headlineLarge: headlineLarge.copyWith(color: const Color(0xff858585)),
        headlineMedium: headlineMedium,
        // headlineSmall: headlineSmall,
        titleLarge: titleLarge.copyWith(color: Colors.black),
        titleMedium: titleMedium.copyWith(color: Colors.black),
        titleSmall: titleSmall.copyWith(color: Colors.black),
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
        labelLarge: labelLarge,
        labelMedium: labelMedium,
        labelSmall: labelSmall,
      ),
    );
  }

  static const headlineLarge = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 24.0,
    letterSpacing: -0.56,
  );

  static const headlineMedium = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    letterSpacing: -0.56,
  );

  static const titleLarge = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
    letterSpacing: -0.5,
  );

  static const labelLarge = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    letterSpacing: -0.5,
  );

  static const titleMedium = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
    letterSpacing: -0.5,
  );

  static const bodyLarge = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
    fontSize: 16.0,
    letterSpacing: -0.5,
  );

  static const labelMedium = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    letterSpacing: -0.5,
  );

  static const titleSmall = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    letterSpacing: -0.5,
  );

  static const bodyMedium = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );

  static const labelSmall = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    letterSpacing: -0.5,
  );

  static const bodySmall = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: "Lato",
    fontSize: 12.0,
    letterSpacing: -0.5,
  );
}

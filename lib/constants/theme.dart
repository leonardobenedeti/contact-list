import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get themeData => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Helvetica',
        textTheme: CustomTheme.textTheme,
        useMaterial3: true,
      );

  static TextTheme get textTheme => const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        headlineLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      );
}

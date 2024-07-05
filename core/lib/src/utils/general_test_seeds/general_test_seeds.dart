import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class GeneralTestSeeds {
  static const String appName = 'Kalshi App QA';
  static const String baseApiUrl = 'http://localhost:3000/';
  static const Flavor flavor = Flavor.qa;
  static ThemeData themeData = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(),
      titleMedium: TextStyle(),
      bodyMedium: TextStyle(),
      bodySmall: TextStyle(),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith((states) {
          return const TextStyle();
        }),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith((states) {
          return const TextStyle();
        }),
      ),
    ),
  );
  static const ThemeColors themeColors = LightThemeColors();
}

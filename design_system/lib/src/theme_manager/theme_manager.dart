import 'package:design_system/design_system.dart';
import 'package:design_system/src/theme_manager/light_theme_colors.dart';
import 'package:design_system/src/theme_manager/theme_colors.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  static const TextStyle _rubikRegularTextStyle =
      TextStyle(fontFamily: 'Rubik-Regular');
  static const TextStyle _rubikMediumTextStyle =
      TextStyle(fontFamily: 'Rubik-Medium');
  static const TextStyle _workSansTextStyle = TextStyle(fontFamily: 'WorkSans');

  static ThemeManager? _instance;
  static ThemeManager get instance => _instance ?? ThemeManager();

  // Here we can add logic to switch between dark/light mode
  ThemeColors get themeColors => const LightThemeColors();

  ThemeData get currentTheme {
    // Here we can add logic to switch between dark/light mode
    return lightTheme;
  }

  ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        scaffoldBackgroundColor: themeColors.backgroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor: themeColors.primaryColor),
        primaryColor: themeColors.primaryColor,
        appBarTheme: AppBarTheme(
          backgroundColor: themeColors.appBarBackgroundColor,
          foregroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 80,
        ),
        textTheme: TextTheme(
          titleLarge: _rubikMediumTextStyle.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: themeColors.primaryTextColor,
          ),
          titleMedium: _workSansTextStyle.copyWith(
            fontSize: 18,
          ),
          bodyMedium: _workSansTextStyle.copyWith(
            fontSize: 14,
            color: themeColors.primaryTextColor,
          ),
          bodySmall: _workSansTextStyle.copyWith(
            fontSize: 12,
            color: themeColors.secondaryTextColor,
          ),
        ),
        cardTheme: CardTheme(
          color: themeColors.defaultCardColor,
          shadowColor: themeColors.defaultCardShadowColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.resolveWith((states) {
              return const Size(double.infinity, 56);
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              return _workSansTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: themeColors.primaryButtonTextColor,
              );
            }),
            backgroundColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.hovered)) {
                return Colors.black12;
              }
              return themeColors.primaryButtonColor;
            }),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.resolveWith((states) {
              return const Size(double.infinity, 56);
            }),
            side: WidgetStateProperty.resolveWith((states) {
              return BorderSide(
                color: themeColors.primaryButtonColor,
                width: 2.0,
              );
            }),
            textStyle: WidgetStateProperty.resolveWith((states) {
              return _workSansTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              );
            }),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: _rubikMediumTextStyle.copyWith(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: themeColors.defaultHintTextColor,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          border: const OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: themeColors.primaryColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: themeColors.defaultBorderColor),
            borderRadius: const BorderRadius.all(Radius.circular(4)),
          ),
        ),
      );

  static ThemeManager of(BuildContext context) {
    return ThemeProvider.of(context).themeManager;
  }
}

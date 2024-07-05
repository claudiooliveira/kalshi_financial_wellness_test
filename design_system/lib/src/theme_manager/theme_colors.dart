import 'package:flutter/material.dart';

abstract class ThemeColors {
  // General
  Color get primaryColor;
  Color get backgroundColor;
  Color get lightBackgroundColor;

  // App bar
  Color get appBarBackgroundColor;

  // Text colors
  Color get primaryTextColor;
  Color get secondaryTextColor;

  // Button colors
  Color get primaryButtonColor;
  Color get primaryButtonTextColor;

  // Card colors
  Color get defaultCardColor;
  Color get defaultCardShadowColor;

  // Input colors
  Color get defaultBorderColor;
  Color get defaultHintTextColor;
  Color get focusedBorderColor;
}

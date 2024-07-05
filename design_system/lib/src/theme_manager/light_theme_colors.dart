import 'package:design_system/src/theme_manager/theme_colors.dart';
import 'package:flutter/material.dart';

class LightThemeColors implements ThemeColors {
  static const Color _primaryColor = Color(0xff001c95);

  const LightThemeColors();

  @override
  Color get backgroundColor => const Color(0xfff4f8fa);

  @override
  Color get lightBackgroundColor => Colors.white;

  @override
  Color get primaryColor => _primaryColor;

  @override
  Color get defaultCardShadowColor => const Color(0xff1E2A32).withOpacity(0.08);

  @override
  Color get appBarBackgroundColor => Colors.white;

  @override
  Color get primaryButtonColor => _primaryColor;

  @override
  Color get primaryButtonTextColor => Colors.white;

  @override
  Color get primaryTextColor => const Color(0xff1E2A32);

  @override
  Color get secondaryTextColor => const Color(0xff708797);

  @override
  Color get defaultCardColor => Colors.white;

  @override
  Color get defaultBorderColor => const Color(0xffE9EEF2);

  @override
  Color get defaultHintTextColor => const Color(0xff4D6475);

  @override
  Color get focusedBorderColor => _primaryColor;
}

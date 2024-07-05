import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HeaderMessage extends StatelessWidget {
  const HeaderMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager.of(context);
    final theme = themeManager.currentTheme;
    final themeColors = themeManager.themeColors;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.x3),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
            text: "Here's your",
            style: theme.textTheme.titleMedium!.copyWith(
              color: themeColors.primaryColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: " financial wellness \nscore.",
            style: theme.textTheme.titleMedium!.copyWith(
              color: themeColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ]),
      ),
    );
  }
}

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';

class FinancialInformation extends StatelessWidget {
  const FinancialInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final themeManager = ThemeManager.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgImage.asset(AppImages.lockIcon),
        const SizedBox(height: Spacing.x3),
        Text(
          localizations.translate('home.financial_information_encrypted'),
          textAlign: TextAlign.center,
          style: themeManager.currentTheme.textTheme.bodySmall,
        ),
      ],
    );
  }
}

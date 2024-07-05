import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:home/src/domain/models/score_result.dart';
import 'package:localizations/localizations.dart';

import 'progress_bar.dart';

class ScoreResultMessage extends StatelessWidget {
  const ScoreResultMessage({
    super.key,
    required this.scoreResult,
  });

  final ScoreResult scoreResult;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final themeManager = ThemeManager.of(context);
    final theme = themeManager.currentTheme;
    final themeColors = themeManager.themeColors;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: Spacing.x3),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(Spacing.x3),
        child: Column(
          children: [
            SvgImage.asset(AppImages.kalshiIcon),
            const SizedBox(height: Spacing.x6),
            ProgressBar(
              percent: scoreResult.percent,
              color: _scoreColor(themeColors),
            ),
            const SizedBox(height: Spacing.x3),
            Text(
              localizations.translate('home.score_${scoreResult.name}_title'),
              style: theme.textTheme.titleLarge,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: localizations.translate(
                        'home.score_${scoreResult.name}_description'),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      color: themeColors.secondaryTextColor,
                    ),
                  ),
                  TextSpan(
                    text: localizations.translate(
                        'home.score_${scoreResult.name}_description_part2'),
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: themeColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: Spacing.x8),
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                localizations.translate('global.return'),
              ),
            ),
            const SizedBox(height: Spacing.x3),
          ],
        ),
      ),
    );
  }

  Color _scoreColor(ThemeColors themeColors) {
    Map<ScoreResult, Color> colors = {
      ScoreResult.healthy: themeColors.scoreHealthyColor,
      ScoreResult.average: themeColors.scoreAverageColor,
      ScoreResult.unhealthy: themeColors.scoreUnhealthyColor,
    };
    return colors[scoreResult]!;
  }
}

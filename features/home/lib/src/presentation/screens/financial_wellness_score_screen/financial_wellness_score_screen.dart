import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:home/src/domain/models/score_result.dart';
import 'package:home/src/presentation/screens/financial_wellness_score_screen/widgets/header_message.dart';
import 'package:home/src/presentation/screens/financial_wellness_score_screen/widgets/score_result_message.dart';
import 'package:home/src/presentation/screens/home_screen/widgets/footer_financial_information.dart';

class FinancialWellnessScoreScreen extends StatelessWidget {
  const FinancialWellnessScoreScreen({
    super.key,
    required this.scoreResult,
  });

  final ScoreResult scoreResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: Spacing.x6),
            const HeaderMessage(),
            const SizedBox(height: Spacing.x6),
            ScoreResultMessage(
              key: Key('score_result_${scoreResult.name}'),
              scoreResult: scoreResult,
            ),
            const SizedBox(height: Spacing.x9),
            const FooterFinancialInformation(),
          ],
        ),
      ),
    );
  }
}

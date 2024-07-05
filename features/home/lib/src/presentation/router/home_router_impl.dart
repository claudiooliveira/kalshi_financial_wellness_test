import 'package:flutter/material.dart';
import 'package:home/src/domain/models/score_result.dart';
import 'package:home/src/presentation/router/home_router.dart';
import 'package:home/src/presentation/screens/financial_wellness_score_screen/financial_wellness_score_screen.dart';

class HomeRouterImpl implements HomeRouter {
  @override
  Future<void> navigateToScoreScreen({
    required BuildContext context,
    required ScoreResult scoreResult,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const FinancialWellnessScoreScreen(),
      ),
    );
  }
}

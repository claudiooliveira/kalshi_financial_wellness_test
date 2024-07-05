import 'package:flutter/material.dart';
import 'package:home/src/domain/models/score_result.dart';

abstract class HomeRouter {
  Future<void> navigateToScoreScreen({
    required BuildContext context,
    required ScoreResult scoreResult,
  });
}

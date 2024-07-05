import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/domain/models/score_result.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  final formKey = GlobalKey<FormState>();
  final annualIncomeController = TextEditingController();
  final monthlyCostsController = TextEditingController();

  void calculateScore() {
    double annualIncome = double.tryParse(annualIncomeController.text) ?? 0;
    double monthlyCosts = double.tryParse(monthlyCostsController.text) ?? 0;

    if (!(formKey.currentState?.validate() ?? false) || annualIncome <= 0) {
      return;
    }

    //Calculation for 8%
    annualIncome = annualIncome * 0.92;

    double annualCosts = monthlyCosts * 12;
    final scoreResult = calculatePercentage(annualCosts / annualIncome);

    emit(FinancialWellnessScoreResult(scoreResult));
  }

  ScoreResult calculatePercentage(double percent) {
    if (percent <= 0.25) {
      return ScoreResult.healthy;
    } else if (percent <= 0.75) {
      return ScoreResult.average;
    } else {
      return ScoreResult.unhealthy;
    }
  }
}

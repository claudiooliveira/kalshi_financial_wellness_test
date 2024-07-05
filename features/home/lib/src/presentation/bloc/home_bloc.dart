import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/domain/models/score_result.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeInitial());

  final formKey = GlobalKey<FormState>();
  final annualIncomeController = TextEditingController();
  final monthlyCostsController = TextEditingController();

  void calculateScore() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    emit(FinancialWellnessScoreResult(ScoreResult.healthy));
  }
}

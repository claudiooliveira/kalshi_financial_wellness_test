import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/src/domain/models/score_result.dart';
import 'package:home/src/presentation/cubit/home_cubit.dart';
import 'package:home/src/presentation/cubit/home_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mock/mocks.dart';

void main() {
  group('HomeCubitTest', () {
    late HomeCubit homeCubit;
    late GlobalKey<FormState> formKey;
    late TextEditingController annualIncomeController;
    late TextEditingController monthlyCostsController;

    setUp(() {
      homeCubit = HomeCubit();

      formKey = FormKeyMock();
      annualIncomeController = TextEditingControllerMock();
      monthlyCostsController = TextEditingControllerMock();

      homeCubit.formKey = formKey;
      homeCubit.annualIncomeController = annualIncomeController;
      homeCubit.monthlyCostsController = monthlyCostsController;

      when(() => formKey.currentState).thenReturn(FormStateMock(true));
    });

    blocTest<HomeCubit, HomeState>(
      'It should calculate score and return financial wellness is healthy',
      build: () {
        when(() => annualIncomeController.text).thenReturn('1000');
        when(() => monthlyCostsController.text).thenReturn('10');
        return homeCubit;
      },
      act: (cubit) => cubit.calculateScore(),
      expect: () => [
        isA<FinancialWellnessScoreResult>().having(
          (state) => state.scoreResult,
          'scoreResult',
          ScoreResult.healthy,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'It should calculate score and return financial wellness is average',
      build: () {
        when(() => annualIncomeController.text).thenReturn('1000');
        when(() => monthlyCostsController.text).thenReturn('30');
        return homeCubit;
      },
      act: (cubit) => cubit.calculateScore(),
      expect: () => [
        isA<FinancialWellnessScoreResult>().having(
          (state) => state.scoreResult,
          'scoreResult',
          ScoreResult.average,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'It should calculate score and return financial wellness is unhealthy',
      build: () {
        when(() => annualIncomeController.text).thenReturn('1000');
        when(() => monthlyCostsController.text).thenReturn('80');
        return homeCubit;
      },
      act: (cubit) => cubit.calculateScore(),
      expect: () => [
        isA<FinancialWellnessScoreResult>().having(
          (state) => state.scoreResult,
          'scoreResult',
          ScoreResult.unhealthy,
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'It should not return any event because the value entered is invalid',
      build: () {
        when(() => annualIncomeController.text).thenReturn('0');
        when(() => monthlyCostsController.text).thenReturn('0');
        return homeCubit;
      },
      act: (cubit) => cubit.calculateScore(),
      expect: () => [],
    );
  });
}

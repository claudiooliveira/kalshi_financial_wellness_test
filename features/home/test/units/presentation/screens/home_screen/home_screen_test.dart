import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/src/domain/models/score_result.dart';
import 'package:home/src/presentation/cubit/home_cubit.dart';
import 'package:home/src/presentation/router/home_router.dart';
import 'package:home/src/presentation/screens/home_screen/home_screen.dart';
import 'package:home/src/presentation/screens/home_screen/widgets/financial_wellness_form.dart';
import 'package:localizations/localizations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

import '../../../../mock/mocks.dart';
import '../../../../seeds.dart';

void main() {
  group('HomeScreenTest', () {
    late AppEnvironment appEnvironment;
    late ThemeManager themeManager;
    late AppLocalizations appLocalizations;
    late HomeRouter homeRouter;
    late Widget homeScreenWidget;
    late HomeCubit homeCubit;

    setUpAll(() {
      registerFallbackValue(ContextMock());
      registerFallbackValue(ScoreResult.average);
    });

    setUp(() {
      appEnvironment = AppEnvironmentMock();
      themeManager = ThemeManagerMock();
      appLocalizations = AppLocalizationsMock();
      homeRouter = HomeRouterMock();
      homeCubit = HomeCubit();

      homeScreenWidget = Builder(builder: (context) {
        return MaterialAppTestWidget(
          themeManager: themeManager,
          appEnvironment: appEnvironment,
          child: MultiProvider(
            providers: [
              BlocProvider<HomeCubit>(
                create: (context) => homeCubit,
              ),
              Provider<HomeRouter>.value(value: homeRouter),
            ],
            child: const HomeScreen(),
          ),
        );
      });

      when(() => appEnvironment.appName).thenReturn(GeneralTestSeeds.appName);
      when(() => appEnvironment.baseApiUrl)
          .thenReturn(GeneralTestSeeds.baseApiUrl);
      when(() => appEnvironment.flavor).thenReturn(GeneralTestSeeds.flavor);
      when(() => themeManager.lightTheme)
          .thenReturn(GeneralTestSeeds.themeData);
      when(() => themeManager.currentTheme)
          .thenReturn(GeneralTestSeeds.themeData);
      when(() => themeManager.themeColors)
          .thenReturn(GeneralTestSeeds.themeColors);
      when(() => appLocalizations.translate(any())).thenAnswer((_) => '');
    });

    testWidgets("It should show HomeScreen", (WidgetTester tester) async {
      await tester.pumpWidget(homeScreenWidget);
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets(
        "It should navigate to FinancialWellnessScoreScreen when the user enters their annual/monthly costs",
        (WidgetTester tester) async {
      await tester.pumpWidget(homeScreenWidget);
      await tester.pumpAndSettle();

      when(() => homeRouter.navigateToScoreScreen(
            context: any(named: 'context'),
            scoreResult: any(named: 'scoreResult'),
          )).thenAnswer((_) async => {});

      final continueButtonFinder =
          find.byKey(const Key('financial_wellness_form.continue_button'));
      final annualIncomeInputFinder =
          find.byKey(const Key('financial_wellness_form.annual_income_input'));
      final monthlyCostsInputFinder =
          find.byKey(const Key('financial_wellness_form.monthly_costs_input'));

      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.byType(FinancialWellnessForm), findsOneWidget);
      expect(continueButtonFinder, findsOneWidget);

      await tester.enterText(annualIncomeInputFinder, Seeds.annualIncomeValue);
      await tester.enterText(
          monthlyCostsInputFinder, Seeds.monthlyCostValueAverage);
      await tester.pumpAndSettle();

      CurrencyTextInput annualIncomeInput =
          tester.firstWidget(annualIncomeInputFinder);
      CurrencyTextInput monthlyCostsInput =
          tester.firstWidget(monthlyCostsInputFinder);

      expect(annualIncomeInput.controller!.text, Seeds.annualIncomeValue);
      expect(monthlyCostsInput.controller!.text, Seeds.monthlyCostValueAverage);

      await tester.tap(continueButtonFinder);
      await tester.pumpAndSettle();

      await tester.pump();

      verify(
        () => homeRouter.navigateToScoreScreen(
          context: any(named: 'context'),
          scoreResult: any(named: 'scoreResult'),
        ),
      ).called(1);
    });
  });
}

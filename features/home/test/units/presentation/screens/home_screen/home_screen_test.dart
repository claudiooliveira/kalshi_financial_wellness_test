// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/src/presentation/cubit/home_cubit.dart';
import 'package:home/src/presentation/router/home_router.dart';
import 'package:home/src/presentation/screens/home_screen/home_screen.dart';
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

    setUp(() {
      appEnvironment = AppEnvironmentMock();
      themeManager = ThemeManagerMock();
      appLocalizations = AppLocalizationsMock();
      homeRouter = HomeRouterMock();
      homeCubit = HomeCubit();

      homeScreenWidget = MaterialAppTestWidget(
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
      when(() => appLocalizations.translate('home.form_title'))
          .thenAnswer((_) => '');
      when(() => appLocalizations.translate('home.form_subtitle'))
          .thenAnswer((_) => '');
      when(() => appLocalizations.translate('home.annual_income_input_label'))
          .thenAnswer((_) => '');
      when(() => appLocalizations.translate('home.monthly_costs_input_label'))
          .thenAnswer((_) => '');
      when(() => appLocalizations.translate('global.continue'))
          .thenAnswer((_) => '');
      when(() => appLocalizations.translate('home.enter_a_valid_value'))
          .thenAnswer((_) => Seeds.enterAValidValueKey);
      when(() => appLocalizations
              .translate('home.enter_a_number_greater_than_zero'))
          .thenAnswer((_) => Seeds.enterANumberGreaterThanZeroKey);
    });

    testWidgets("It should show HomeScreen", (WidgetTester tester) async {
      await tester.pumpWidget(homeScreenWidget);
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });

    // testWidgets(
    //     "It should show error messages when the values provided are not valid",
    //     (WidgetTester tester) async {
    //   await tester.pumpWidget(homeScreenWidget);
    //   await tester.pumpAndSettle();

    //   final continueButtonFinder =
    //       find.byKey(const Key('financial_wellness_form.continue_button'));

    //   expect(continueButtonFinder, findsOneWidget);

    //   await tester.tap(continueButtonFinder);
    //   await tester.pump();

    //   await tester.pumpAndSettle();

    //   final textFinder = find.text(Seeds.enterAValidValueKey);
    //   final validationMessageFinder =
    //       find.descendant(of: continueButtonFinder, matching: textFinder);
    //   expect(validationMessageFinder, findsOneWidget);

    //   //expect(find.text(Seeds.enterANumberGreaterThanZeroKey), findsOneWidget);
    // });
  });
}

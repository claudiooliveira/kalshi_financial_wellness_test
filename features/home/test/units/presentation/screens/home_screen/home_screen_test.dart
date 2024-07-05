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
      when(() => appLocalizations.translate(any())).thenAnswer((_) => '');
    });

    testWidgets("It should show HomeScreen", (WidgetTester tester) async {
      await tester.pumpWidget(homeScreenWidget);
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}

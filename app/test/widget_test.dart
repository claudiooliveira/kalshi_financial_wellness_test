// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home/home.dart';
import 'package:kalshi_financial_wellness_test/app.dart';
import 'package:localizations/localizations.dart';
import 'package:mocktail/mocktail.dart';

import 'mock/mocks.dart';
import 'seeds.dart';

void main() {
  //
  // Hey, maybe the tests you're looking for are in the features/home package!
  //

  group('App', () {
    late AppEnvironment appEnvironment;
    late ThemeManager themeManager;
    late AppLocalizations appLocalizations;

    setUp(() {
      appEnvironment = AppEnvironmentMock();
      themeManager = ThemeManagerMock();
      appLocalizations = AppLocalizationsMock();

      when(() => appEnvironment.appName).thenReturn(Seeds.appName);
      when(() => appEnvironment.baseApiUrl).thenReturn(Seeds.baseApiUrl);
      when(() => appEnvironment.flavor).thenReturn(Seeds.flavor);
      when(() => themeManager.lightTheme).thenReturn(Seeds.themeData);
      when(() => themeManager.currentTheme).thenReturn(Seeds.themeData);
      when(() => themeManager.themeColors).thenReturn(Seeds.themeColors);
      when(() => appLocalizations.translate(any())).thenAnswer((_) => '');
    });

    testWidgets("Check if the HomeFeature is opening when launching the app",
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(
        ThemeProvider(
          themeManager: themeManager,
          child: App(
            env: appEnvironment,
            themeManager: themeManager,
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(MaterialApp), findsOneWidget);
      expect(find.byType(HomeFeature), findsOneWidget);
    });
  });
}

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:home/src/presentation/router/home_router.dart';
import 'package:localizations/localizations.dart';
import 'package:mocktail/mocktail.dart';

class AppEnvironmentMock extends Mock implements AppEnvironment {}

class ThemeManagerMock extends Mock implements ThemeManager {}

class AppLocalizationsMock extends Mock implements AppLocalizations {}

class HomeRouterMock extends Mock implements HomeRouter {}

class TextEditingControllerMock extends Mock implements TextEditingController {}

class FormKeyMock extends Mock implements GlobalKey<FormState> {}

class FormStateMock extends Mock implements FormState {
  FormStateMock(this.isValid);

  final bool isValid;

  @override
  bool validate() => isValid;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return super.toString();
  }
}

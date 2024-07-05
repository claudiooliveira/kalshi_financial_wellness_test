import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localizations/src/exceptions/localizations_exception.dart';

import 'exceptions/missing_key_exception.dart';

class AppLocalizations {
  late Locale locale;
  final bool isTest;

  AppLocalizations({
    this.isTest = false,
    Locale? locale,
  }) {
    if (locale != null) {
      this.locale = locale;
    }
  }

  static AppLocalizations? _instance;
  static AppLocalizations get instance =>
      _instance ?? (_instance = AppLocalizations());

  static AppLocalizations of(BuildContext context) {
    _instance = Localizations.of<AppLocalizations>(context, AppLocalizations);
    if (_instance == null) {
      throw const LocalizationsException();
    }
    return instance;
  }

  static List<LocalizationsDelegate> delegates({bool isTest = false}) => [
        AppLocalizationsDelegate(isTest: isTest),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  static List<Locale> get supportedLocales => [
        const Locale('en', 'US'),
        const Locale('en_US'),
      ];

  late Map<String, String> _localizedStrings;

  Future<bool> load({Map<String, dynamic>? tokens}) async {
    final String filePath =
        'packages/localizations/src/i18n/${_getLanguage()}.json';

    final Map<String, dynamic> jsonMap =
        tokens ?? await _loadJsonFromFile(filePath);

    _localizedStrings = {};

    jsonMap.forEach(
      (key, value) => (value as Map<String, dynamic>).forEach((k, value) {
        _localizedStrings['$key.$k'] = value.toString();
      }),
    );

    return true;
  }

  Future<AppLocalizations> loadTest(Locale locale) async =>
      AppLocalizations(locale: locale);

  String translate(String key, {List<dynamic>? params}) {
    if (isTest) {
      return key;
    }

    final localizedString = _localizedStrings[key] ?? '';
    if (params != null && params.isNotEmpty) {
      final coded = params.asMap().keys.map((key) => '{$key}').toList();
      final map = Map.fromIterables(coded, params);
      return map.entries.fold(
        localizedString,
        (previousValue, element) => previousValue.replaceAll(
          element.key,
          element.value?.toString() ?? '',
        ),
      );
    }
    if (localizedString.isEmpty) {
      throw MissingKeyException(key);
    }
    return localizedString;
  }

  String translatePlural(
    num value, {
    required String singular,
    required String plural,
    List<dynamic>? params,
  }) {
    final key = value <= 1 ? singular : plural;
    if (isTest) {
      return key;
    }

    final localizedString = _localizedStrings[key] ?? '';
    if (params != null && params.isNotEmpty) {
      final coded = params.asMap().keys.map((key) => '{$key}').toList();
      final map = Map.fromIterables(coded, params);
      return map.entries.fold(
        localizedString,
        (previousValue, element) => previousValue.replaceAll(
          element.key,
          element.value?.toString() ?? '',
        ),
      );
    }
    if (localizedString.isEmpty) {
      throw MissingKeyException(key);
    }
    return localizedString;
  }

  Future<Map<String, dynamic>> _loadJsonFromFile(String path) async {
    final String jsonString = await rootBundle.loadString(path);
    return json.decode(jsonString) ?? {};
  }

  String _getLanguage() {
    if (locale.countryCode != null && locale.countryCode!.isNotEmpty) {
      return '${locale.languageCode}_${locale.countryCode}';
    }

    return locale.languageCode;
  }
}

@visibleForTesting
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate({this.isTest = false});

  final bool isTest;

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale: locale, isTest: isTest);

    if (isTest) {
      await localizations.loadTest(locale);
    } else {
      await localizations.load();
    }

    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

extension StringTranslateExtension on String {
  String translate(
    BuildContext context, {
    List<dynamic>? params,
  }) =>
      AppLocalizations.of(context).translate(this, params: params);
}

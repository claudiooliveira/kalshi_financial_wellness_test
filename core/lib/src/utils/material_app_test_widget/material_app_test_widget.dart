import 'dart:convert';
import 'dart:typed_data';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:localizations/localizations.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

class MaterialAppTestWidget extends StatelessWidget {
  const MaterialAppTestWidget({
    super.key,
    required this.themeManager,
    required this.appEnvironment,
    required this.child,
  });

  final ThemeManager themeManager;
  final AppEnvironment appEnvironment;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      themeManager: themeManager,
      child: MultiProvider(
        providers: [
          Provider<AppEnvironment>.value(value: appEnvironment),
        ],
        child: GestureDetector(
          onTap: () => keyboardClose(),
          child: DefaultAssetBundle(
            bundle: _FakeAssetBundle(),
            child: MaterialApp(
              title: appEnvironment.appName,
              theme: themeManager.lightTheme,
              localizationsDelegates: AppLocalizations.delegates(isTest: true),
              supportedLocales: AppLocalizations.supportedLocales,
              locale: const Locale('en', 'en-US'),
              debugShowCheckedModeBanner: false,
              home: child,
            ),
          ),
        ),
      ),
    );
  }
}

class _FakeAssetBundle extends Fake implements AssetBundle {
  static const String _svgStr = '''<svg viewBox="0 0 10 10"></svg>''';

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    return _svgStr;
  }

  @override
  Future<ByteData> load(String key) async {
    return Uint8List.fromList(utf8.encode(_svgStr)).buffer.asByteData();
  }
}

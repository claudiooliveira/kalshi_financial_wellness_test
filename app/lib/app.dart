import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:kalshi_financial_wellness_test/core/router/router.dart';
import 'package:provider/provider.dart';
import 'package:localizations/localizations.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.env,
    required this.themeManager,
  });

  final AppEnvironment env;
  final ThemeManager themeManager;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppEnvironment>.value(value: env),
      ],
      child: GestureDetector(
        onTap: () => keyboardClose(),
        child: MaterialApp.router(
          routerConfig: routerConfig,
          title: env.appName,
          theme: themeManager.lightTheme,
          localizationsDelegates: AppLocalizations.delegates(),
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('en', 'en-US'),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

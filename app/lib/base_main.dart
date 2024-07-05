import 'dart:async';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'app.dart';

Future<void> baseMain(
  AppEnvironment env,
) async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeManager = ThemeManager.instance;
  runApp(
    ThemeProvider(
      themeManager: themeManager,
      child: App(
        env: env,
        themeManager: themeManager,
      ),
    ),
  );
}

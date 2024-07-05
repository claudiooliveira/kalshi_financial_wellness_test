import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider(
      {required this.themeManager, required Widget child, Key? key})
      : super(key: key, child: child);

  final ThemeManager themeManager;

  static ThemeProvider of<FlutterstrapColorScheme>(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return oldWidget.themeManager.themeColors != themeManager.themeColors ||
        oldWidget.child != child;
  }
}

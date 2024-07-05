import 'package:flutter/material.dart';

Color? colorFromString(String text) {
  final colorInt = int.parse(text.replaceAll('#', ''), radix: 16) + 0xFF000000;
  return Color(colorInt);
}

import 'package:flutter/material.dart';
import 'package:home/home.dart';

class HomeScreen extends StatelessWidget {
  static String routerPath = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeFeature();
  }
}

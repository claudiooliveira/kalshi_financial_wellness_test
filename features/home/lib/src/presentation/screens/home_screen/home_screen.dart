import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/presentation/bloc/home_bloc.dart';
import 'package:home/src/presentation/bloc/home_state.dart';
import 'package:home/src/presentation/router/home_router.dart';
import 'package:home/src/presentation/screens/home_screen/widgets/financial_information.dart';
import 'package:home/src/presentation/screens/home_screen/widgets/financial_wellness_form.dart';
import 'package:home/src/presentation/screens/home_screen/widgets/welcome_message.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // To increase flexibility when we are working with themes
    // We can call the ThemeManager directly to use some specific colors
    // regardless of whether it is in light or dark mode
    final themeManager = ThemeManager.of(context);
    final themeColors = themeManager.themeColors;
    final router = context.read<HomeRouter>();
    return Scaffold(
      // For example, in ThemeData we only have the scaffoldBackgroundColor,
      // to represent a background color, but in this case, I want to change it
      // to a different color
      backgroundColor: themeColors.lightBackgroundColor,
      appBar: const StandardAppBar(),
      body: BlocListener<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is FinancialWellnessScoreResult) {
            router.navigateToScoreScreen(
              context: context,
              scoreResult: state.scoreResult,
            );
          }
        },
        child: const SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: Spacing.x6),
              WelcomeMessage(),
              SizedBox(height: Spacing.x6),
              FinancialWellnessForm(),
              SizedBox(height: Spacing.x6),
              FinancialInformation(),
            ],
          ),
        ),
      ),
    );
  }
}

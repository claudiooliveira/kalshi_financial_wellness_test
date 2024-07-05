import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/presentation/bloc/home_bloc.dart';
import 'package:localizations/localizations.dart';
import 'package:flutter/material.dart';

class FinancialWellnessForm extends StatelessWidget {
  const FinancialWellnessForm({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final themeManager = ThemeManager.of(context);
    final bloc = context.read<HomeBloc>();
    final theme = themeManager.currentTheme;
    final themeColors = themeManager.themeColors;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: Spacing.x3),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(Spacing.x3),
        child: Form(
          key: bloc.formKey,
          child: Column(
            children: [
              SvgImage.asset(AppImages.kalshiIcon),
              const SizedBox(height: Spacing.x3),
              Text(
                localizations.translate('home.form_title'),
                style: theme.textTheme.titleLarge,
              ),
              Text(
                localizations.translate('home.form_subtitle'),
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: themeColors.secondaryTextColor),
              ),
              const SizedBox(height: Spacing.x3),
              CurrencyTextInput(
                controller: bloc.annualIncomeController,
                validator: (value) => _currencyInputValidator(
                  context: context,
                  value: value,
                ),
                labelText:
                    localizations.translate('home.annual_income_input_label'),
              ),
              const SizedBox(height: Spacing.x3),
              CurrencyTextInput(
                controller: bloc.monthlyCostsController,
                labelText:
                    localizations.translate('home.monthly_costs_input_label'),
                validator: (value) => _currencyInputValidator(
                  context: context,
                  value: value,
                ),
              ),
              const SizedBox(height: Spacing.x3),
              TextButton(
                onPressed: bloc.calculateScore,
                child: Text(
                  localizations.translate('global.continue'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? _currencyInputValidator({
    required BuildContext context,
    String? value,
  }) {
    final localizations = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return localizations.translate('home.enter_a_valid_value');
    }
    if (((double.tryParse(value) ?? 0)) <= 0) {
      return localizations.translate('home.enter_a_number_greater_than_zero');
    }
    return null;
  }
}

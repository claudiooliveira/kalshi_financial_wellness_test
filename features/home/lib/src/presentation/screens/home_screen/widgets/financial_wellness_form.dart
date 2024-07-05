import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/src/presentation/cubit/home_cubit.dart';
import 'package:localizations/localizations.dart';
import 'package:flutter/material.dart';

class FinancialWellnessForm extends StatelessWidget {
  const FinancialWellnessForm({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final themeManager = ThemeManager.of(context);
    final cubit = context.read<HomeCubit>();
    final theme = themeManager.currentTheme;
    final themeColors = themeManager.themeColors;
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: Spacing.x3),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(Spacing.x3),
        child: Form(
          key: cubit.formKey,
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
                key: const Key('financial_wellness_form.annual_income_input'),
                controller: cubit.annualIncomeController,
                validator: (value) => _currencyInputValidator(
                  context: context,
                  value: value,
                ),
                labelText:
                    localizations.translate('home.annual_income_input_label'),
              ),
              const SizedBox(height: Spacing.x3),
              CurrencyTextInput(
                key: const Key('financial_wellness_form.monthly_costs_input'),
                controller: cubit.monthlyCostsController,
                labelText:
                    localizations.translate('home.monthly_costs_input_label'),
                validator: (value) => _currencyInputValidator(
                  context: context,
                  value: value,
                ),
              ),
              const SizedBox(height: Spacing.x3),
              TextButton(
                key: const Key('financial_wellness_form.continue_button'),
                onPressed: cubit.calculateScore,
                child: Text(
                  localizations.translate('global.continue'),
                  style: theme.textButtonTheme.style!.textStyle!.resolve({}),
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

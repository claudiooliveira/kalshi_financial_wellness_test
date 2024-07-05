import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CurrencyTextInput extends StatelessWidget {
  const CurrencyTextInput({
    super.key,
    this.controller,
    this.labelText,
    this.validator,
  });

  final String? labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    final themeManager = ThemeManager.of(context);
    final theme = themeManager.currentTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: Spacing.x1),
        ],
        TextFormField(
          keyboardType: TextInputType.number,
          controller: controller,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: theme.inputDecorationTheme.hintStyle,
          decoration: InputDecoration(
            hintText: '0,0',
            contentPadding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 12,
            ),
            prefixIcon: Container(
              padding: const EdgeInsets.all(12),
              child: SvgImage.asset(
                AppImages.cashIcon,
                width: 12,
                height: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

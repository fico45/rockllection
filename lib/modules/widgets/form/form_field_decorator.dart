import 'package:flutter/material.dart';
import 'package:flutter_template/theme/theme_data.dart';

class FormFieldDecorator {
  const FormFieldDecorator();
  static FormFieldBorderDecorator get border =>
      const FormFieldBorderDecorator();
  static InputDecoration get defaultInputDecoration => InputDecoration(
      filled: true,
      disabledBorder: FormFieldDecorator.border.outlinedInputBorder,
      enabledBorder: FormFieldDecorator.border.outlinedInputBorder,
      focusedBorder: FormFieldDecorator.border.outlinedInputBorder,
      focusedErrorBorder: FormFieldDecorator.border.errorInputBorder,
      errorBorder: FormFieldDecorator.border.errorInputBorder,
      contentPadding: const EdgeInsets.all(16),
      hintStyle: CustomTheme.light.textTheme.bodyLarge!);
}

class FormFieldBorderDecorator {
  const FormFieldBorderDecorator();
  BorderRadius get borderRadius => BorderRadius.circular(16);

  OutlineInputBorder get errorInputBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: CustomTheme.light.colorScheme.error,
          width: 2,
        ),
        borderRadius: borderRadius,
      );
  OutlineInputBorder get outlinedInputBorder => OutlineInputBorder(
        borderSide: const BorderSide(
          color: Colors.transparent,
        ),
        borderRadius: borderRadius,
      );
}

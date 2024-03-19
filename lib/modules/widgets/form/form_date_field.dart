import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_template/modules/widgets/form/form_field_decorator.dart';
import 'package:flutter_template/utils/extensions.dart';

class FormDateField extends ConsumerWidget {
  const FormDateField({
    super.key,
    required this.label,
    required this.formControlName,
    this.requiredErrorMessage,
    this.readOnly = false,
    this.required = false,
    this.isEndDateUnbounded = false,
  });

  final String label;
  final String formControlName;
  final String? requiredErrorMessage;
  final bool readOnly;
  final bool required;
  final bool isEndDateUnbounded;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ReactiveDatePicker(
      firstDate: DateTime.now().subtract(const Duration(days: 90)),
      lastDate: isEndDateUnbounded
          ? DateTime.now().add(const Duration(days: 500))
          : DateTime.now(),
      formControlName: formControlName,
      builder: (context, picker, child) {
        return ReactiveTextField<DateTime>(
          formControlName: formControlName,
          mouseCursor: SystemMouseCursors.click,
          readOnly: true,
          onTap: (control) => picker.showPicker(),
          decoration: InputDecoration(
            labelText: required ? '$label*' : label,
            border: required
                ? FormFieldDecorator.border.outlinedInputBorder
                : const OutlineInputBorder(),
            enabledBorder: required
                ? FormFieldDecorator.border.outlinedInputBorder
                : const OutlineInputBorder(),
            focusedBorder: required
                ? FormFieldDecorator.border.outlinedInputBorder
                : const OutlineInputBorder(),
            focusedErrorBorder: required
                ? FormFieldDecorator.border.errorInputBorder
                : const OutlineInputBorder(),
            prefixIcon:
                Icon(Icons.punch_clock, color: context.colorScheme.primary),
            suffixIcon: const Icon(Icons.calendar_view_week),
          ),
          validationMessages: {
            'required': (error) =>
                requiredErrorMessage != null && requiredErrorMessage!.isNotEmpty
                    ? requiredErrorMessage!
                    : 'This field is required',
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_template/utils/translations/translations.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_template/modules/widgets/form/form_field_decorator.dart';
import 'package:flutter_template/utils/extensions.dart';

class FormDropdownField extends StatefulWidget {
  const FormDropdownField({
    super.key,
    required this.formControlName,
    required this.label,
    this.required = false,
    required this.items,
    this.prefixIcon,
    this.onChanged,
  });

  final String formControlName;
  final String label;
  final bool required;
  final List<DropdownMenuItem> items;
  final Widget? prefixIcon;

  final void Function(FormControl)? onChanged;

  @override
  State<FormDropdownField> createState() => _FormDropdownFieldState();
}

class _FormDropdownFieldState extends State<FormDropdownField> {
  @override
  Widget build(BuildContext context) {
    return ReactiveDropdownField(
      formControlName: widget.formControlName,
      items: widget.items,
      decoration: InputDecoration(
        label: Text(
          widget.required ? '${widget.label}*' : widget.label,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: context.colorScheme.onInverseSurface,
        border: FormFieldDecorator.border.outlinedInputBorder,
        disabledBorder: FormFieldDecorator.border.outlinedInputBorder,
        enabledBorder: FormFieldDecorator.border.outlinedInputBorder,
        focusedBorder: FormFieldDecorator.border.outlinedInputBorder,
        focusedErrorBorder: FormFieldDecorator.border.errorInputBorder,
        prefixIcon: widget.prefixIcon,
        errorBorder: FormFieldDecorator.border.errorInputBorder,
        contentPadding: const EdgeInsets.all(14),
      ),
      validationMessages: {
        'required': (error) => MyTranslations.validation.required,
      },
      onChanged: widget.onChanged,
    );
  }
}

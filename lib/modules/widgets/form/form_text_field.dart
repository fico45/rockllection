import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/utils/translations/translations.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_template/modules/widgets/form/form_field_decorator.dart';
import 'package:flutter_template/utils/extensions.dart';

class FormTextField<T> extends StatefulWidget {
  const FormTextField({
    super.key,
    this.focusNode,
    this.formControlName,
    this.formControl,
    this.onChanged,
    this.onTap,
    this.onSubmitted,
    this.textInputAction,
    this.obscureText,
    required this.label,
    this.isPassword = false,
    this.voidCallback,
    this.isNumber = false,
    this.prefixIcon,
    this.required = false,
  });

  final FocusNode? focusNode;
  final String? formControlName;
  final FormControl<T>? formControl;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final String label;
  final bool isPassword;
  final VoidCallback? voidCallback;
  final bool isNumber;
  final Widget? prefixIcon;
  final bool required;

  final void Function(FormControl<T>)? onChanged;
  final void Function(FormControl<T>)? onTap;
  final void Function(FormControl<T>)? onSubmitted;

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      decoration: FormFieldDecorator.defaultInputDecoration.copyWith(
        fillColor: context.colorScheme.onInverseSurface,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: widget.prefixIcon,
        iconColor: context.colorScheme.onInverseSurface,
        label: Text(
          widget.required ? "${widget.label}*" : widget.label,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  widget.voidCallback!();
                },
                icon: Icon(
                  widget.obscureText! ? Icons.visibility : Icons.visibility_off,
                ),
              )
            : null,
      ),
      inputFormatters: [
        if (widget.isNumber) FilteringTextInputFormatter.digitsOnly
      ],
      keyboardType: widget.formControlName == 'email'
          ? TextInputType.emailAddress
          : widget.isNumber
              ? TextInputType.number
              : TextInputType.text,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      obscureText: widget.obscureText ?? false,
      textInputAction: widget.textInputAction,
      onSubmitted: widget.onSubmitted,
      formControlName: widget.formControlName,
      formControl: widget.formControl,
      validationMessages: {
        ValidationMessage.required: (error) =>
            MyTranslations.validation.required,
        ValidationMessage.email: (error) => MyTranslations.validation.email,
        ValidationMessage.minLength: (error) =>
            MyTranslations.validation.passwordMinLength,
        ValidationMessage.mustMatch: (error) =>
            MyTranslations.validation.passwordMustMatch,
      },
    );
  }
}

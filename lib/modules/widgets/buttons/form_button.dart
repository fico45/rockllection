import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rockllection/modules/widgets/buttons/button.dart';
import 'package:rockllection/provider/form_validator/form_validator_provider.dart';

class FormButton extends ConsumerWidget {
  const FormButton({
    required this.type,
    required this.child,
    required this.onPressed,
    super.key,
  });
  final String child;
  final Function()? onPressed;
  final ButtonType type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFormValid = ref.watch(formValidatorProvider);
    return ReactiveFormConsumer(
      child: Button(
        child: child,
        onPressed: !isFormValid ? null : onPressed,
        type: type,
      ),
      builder: (context, formGroup, child) {
        return child!;
      },
    );
  }
}

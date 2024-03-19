import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/modules/auth/auth_controller.dart';
import 'package:flutter_template/modules/widgets/buttons/button.dart';
import 'package:flutter_template/modules/widgets/buttons/form_button.dart';
import 'package:flutter_template/modules/widgets/form/form_text_field.dart';
import 'package:flutter_template/provider/auth/auth_provider.dart';
import 'package:flutter_template/provider/form_validator/form_validator_provider.dart';
import 'package:flutter_template/utils/consts.dart';
import 'package:flutter_template/utils/extensions.dart';
import 'package:flutter_template/utils/translations/translations.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  bool hidePassword = true;

  void togglePassword() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final formValidityNotifier = ref.read(formValidatorProvider.notifier);
    final authPr = ref.read(authProvider.notifier);
    final form = ref.watch(authControllerProvider.notifier).registerFormGroup;
    final controller = ref.read(authControllerProvider.notifier);

    if (mounted) {
      form.statusChanged.listen((status) {
        formValidityNotifier.updateValidity(isValid: form.valid);
      });
    }

    return Column(
      children: [
        FormTextField(
          required: true,
          label: MyTranslations.auth.register.fields.email,
          formControlName: 'email',
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.mail_outline,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
          onSubmitted: (_) {
            form.focus('firstName');
          },
        ),
        SizedBox(
          height: MyFacts.size.sizeS,
        ),
        FormTextField(
          required: true,
          label: MyTranslations.auth.register.fields.firstName,
          formControlName: 'firstName',
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.person_outline_rounded,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
          onSubmitted: (_) {
            form.focus('lastName');
          },
        ),
        SizedBox(
          height: MyFacts.size.sizeS,
        ),
        FormTextField(
          required: true,
          label: MyTranslations.auth.register.fields.lastName,
          formControlName: 'lastName',
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.person_outline_rounded,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
          onSubmitted: (_) {
            form.focus('company');
          },
        ),
        SizedBox(
          height: MyFacts.size.sizeS,
        ),
        FormTextField(
          required: true,
          label: MyTranslations.auth.register.fields.password,
          formControlName: 'password',
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
          obscureText: hidePassword,
          isPassword: true,
          voidCallback: togglePassword,
          onSubmitted: (_) async {
            form.focus('passwordConfirmation');
          },
        ),
        SizedBox(
          height: MyFacts.size.sizeS,
        ),
        FormTextField(
          required: true,
          label: MyTranslations.auth.register.fields.confirmPassword,
          formControlName: 'passwordConfirmation',
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
          obscureText: hidePassword,
          voidCallback: togglePassword,
          isPassword: true,
          onSubmitted: (_) async {
            //if (!form.valid) return;
          },
        ),
        SizedBox(
          height: MyFacts.size.sizeM,
        ),
        FormButton(
          type: ButtonType.primary,
          onPressed: () async {
            /*     form.markAllAsTouched();
                            if (!form.valid) return; */
            await controller.submit();
          },
          child: MyTranslations.auth.register.buttons.submit,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rockllection/modules/widgets/buttons/button.dart';
import 'package:rockllection/modules/widgets/buttons/form_button.dart';
import 'package:rockllection/modules/widgets/form/form_text_field.dart';
import 'package:rockllection/provider/auth/auth_provider.dart';
import 'package:rockllection/provider/form_validator/form_validator_provider.dart';
import 'package:rockllection/utils/consts.dart';
import 'package:rockllection/modules/auth/auth_controller.dart';
import 'package:rockllection/utils/extensions.dart';
import 'package:rockllection/utils/translations/translations.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  bool isLoading = false;

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
    final form = ref.watch(authControllerProvider.notifier).loginFormGroup;
    final controller = ref.read(authControllerProvider.notifier);

    if (mounted) {
      form.statusChanged.listen((status) {
        formValidityNotifier.updateValidity(isValid: form.valid);
      });
    }

    return Column(
      children: [
        FormTextField(
          label: MyTranslations.auth.login.fields.email,
          formControlName: 'email',
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.mail_outline,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
          required: true,
          onSubmitted: (_) {
            form.focus('password');
          },
        ),
        SizedBox(
          height: MyFacts.size.sizeS,
        ),
        FormTextField(
          label: MyTranslations.auth.login.fields.password,
          formControlName: 'password',
          textInputAction: TextInputAction.done,
          prefixIcon: Icon(
            Icons.lock_outline_rounded,
            color: context.colorScheme.onSurface.withOpacity(0.6),
          ),
          obscureText: hidePassword,
          isPassword: true,
          voidCallback: togglePassword,
          required: true,
          onSubmitted: (_) async {
            if (!form.valid) return;
            await authPr.signIn(
              email: form.control('email').value,
              password: form.control('password').value,
            );
          },
        ),
        SizedBox(
          height: MyFacts.size.sizeM,
        ),
        IconButton(
          onPressed: () async {
            await controller.googleSignIn();
          },
          icon: Image.asset(
            'assets/icons/google.png',
            width: 30,
          ),
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
          child: MyTranslations.auth.login.buttons.submit,
        ),
      ],
    );
  }
}

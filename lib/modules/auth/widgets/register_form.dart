import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rockllection/modules/auth/auth_controller.dart';
import 'package:rockllection/modules/widgets/buttons/button.dart';
import 'package:rockllection/modules/widgets/buttons/form_button.dart';
import 'package:rockllection/modules/widgets/form/form_text_field.dart';
import 'package:rockllection/provider/auth/auth_provider.dart';
import 'package:rockllection/utils/consts.dart';
import 'package:rockllection/utils/extensions.dart';
import 'package:rockllection/utils/toast.dart';
import 'package:rockllection/utils/translations/translations.dart';

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
    final authPr = ref.read(authProvider.notifier);
    final form = ref.watch(authControllerProvider.notifier).registerFormGroup;
    final controller = ref.read(authControllerProvider.notifier);

    return Padding(
      padding: MyFacts.padding.formPadding,
      child: ReactiveForm(
        formGroup: form,
        child: Column(
          children: [
            SizedBox(
              height: MyFacts.size.sizeS,
            ),
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
              child: MyTranslations.auth.register.buttons.submit,
            ),
          ],
        ),
      ),
    );
  }
}

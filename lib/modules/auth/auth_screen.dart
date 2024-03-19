import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/modules/auth/widgets/logo.dart';
import 'package:flutter_template/modules/widgets/scaffold/my_scaffold.dart';
import 'package:flutter_template/utils/translations/translations.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_template/modules/auth/auth_controller.dart';
import 'package:flutter_template/modules/auth/widgets/login_form.dart';
import 'package:flutter_template/modules/auth/widgets/register_form.dart';
import 'package:flutter_template/modules/widgets/buttons/text_button.dart';
import 'package:flutter_template/modules/widgets/scroll_wrappers/scroll_wrapper.dart';
import 'package:flutter_template/utils/consts.dart';
import 'package:flutter_template/utils/extensions.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  static String get routeName => 'auth';
  static String get routeLocation => '/$routeName';
  static String get title => MyTranslations.auth.login.title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final isLogin = ref.watch(authControllerProvider);
    final form = isLogin
        ? ref.watch(authControllerProvider.notifier).loginFormGroup
        : ref.watch(authControllerProvider.notifier).registerFormGroup;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        form.markAllAsTouched();
      },
      child: MyScaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: MyFacts.padding.formPadding,
                child: ReactiveForm(
                  formGroup: form,
                  child: ScrollWrapper(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).padding.top,
                            ),
                            const MyLogo(),
                            SizedBox(
                              height: MyFacts.size.sizeXXS,
                            ),
                            Text(
                              isLogin
                                  ? MyTranslations.auth.login.title
                                  : MyTranslations.auth.register.title,
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.center,
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: isLogin
                                ? const LoginForm()
                                : const RegisterForm(),
                          ),
                        ),
                        if (isLogin)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: CustomTextButton(
                                  onPressed: () async {},
                                  child: Text(
                                    MyTranslations.auth.forgotPassword.title,
                                    style:
                                        context.textTheme.bodyLarge!.copyWith(
                                      color: context.colorScheme.onBackground,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        const Spacer(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              CustomTextButton(
                                child: RichText(
                                  text: TextSpan(
                                    text: isLogin
                                        ? MyTranslations
                                            .auth.login.buttons.goToRegister
                                        : MyTranslations
                                            .auth.register.buttons.goToLogin,
                                    style:
                                        context.textTheme.bodySmall!.copyWith(
                                      color:
                                          context.colorScheme.onSurfaceVariant,
                                    ),
                                    children: <TextSpan>[
                                      const TextSpan(text: ' '),
                                      TextSpan(
                                        text: isLogin
                                            ? MyTranslations
                                                .auth.login.buttons.signUp
                                            : MyTranslations
                                                .auth.register.buttons.login,
                                        style: context.textTheme.bodySmall!
                                            .copyWith(
                                          color:
                                              context.colorScheme.onBackground,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onPressed: () async {
                                  form.reset();
                                  ref
                                      .read(authControllerProvider.notifier)
                                      .setLoginState(!isLogin);
                                },
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).padding.bottom,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

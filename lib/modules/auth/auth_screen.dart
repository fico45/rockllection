import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rockllection/modules/auth/widgets/logo.dart';
import 'package:rockllection/modules/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:rockllection/modules/widgets/scaffold/my_scaffold.dart';
import 'package:rockllection/provider/app_auth_state/app_auth_state.dart';
import 'package:rockllection/provider/app_auth_state/app_auth_state_provider.dart';
import 'package:rockllection/utils/api/api.dart';
import 'package:rockllection/utils/translations/translations.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:rockllection/modules/auth/auth_controller.dart';
import 'package:rockllection/modules/auth/widgets/login_form.dart';
import 'package:rockllection/modules/auth/widgets/register_form.dart';
import 'package:rockllection/modules/widgets/buttons/text_button.dart';
import 'package:rockllection/modules/widgets/scroll_wrappers/scroll_wrapper.dart';
import 'package:rockllection/utils/consts.dart';
import 'package:rockllection/utils/extensions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});
  static String get routeName => 'auth';
  static String get routeLocation => '/$routeName';
  static String get title => MyTranslations.auth.login.title;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthPageState();
}

class _AuthPageState extends ConsumerState<AuthScreen> {
  late final supabase = ref.read(apiProvider);

  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  void _setupAuthListener() {}

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(authControllerProvider.notifier).loginFormGroup;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        form.markAllAsTouched();
      },
      child: MyScaffold(
        body: ScrollWrapper(
          child: Padding(
            padding: MyFacts.padding.formPadding,
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height:
                        MediaQuery.of(context).padding.top + MyFacts.size.sizeS,
                  ),
                  const MyLogo(),
                  SizedBox(
                    height: MyFacts.size.sizeXXS,
                  ),
                  Text(
                    MyTranslations.auth.login.title,
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  LoginForm(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomTextButton(
                          onPressed: () async {},
                          child: Text(
                            MyTranslations.auth.forgotPassword.title,
                            style: context.textTheme.bodyLarge!.copyWith(
                              color: context.colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomTextButton(
                    child: RichText(
                      text: TextSpan(
                        text: MyTranslations.auth.login.buttons.goToRegister,
                        style: context.textTheme.bodySmall!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                        children: <TextSpan>[
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: MyTranslations.auth.login.buttons.signUp,
                            style: context.textTheme.bodySmall!.copyWith(
                              color: context.colorScheme.onBackground,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    onPressed: () async {
                      form.reset();
                      MyBottomSheet.showBottomSheet(
                        context: context,
                        title: MyTranslations.auth.register.title,
                        content: const RegisterForm(),
                      );
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

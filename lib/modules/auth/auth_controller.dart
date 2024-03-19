import 'package:flutter_template/provider/async_loading/async_loading_provider.dart';
import 'package:flutter_template/provider/auth/auth_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_template/utils/consts.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  bool build() => true;

  void setLoginState(bool newState) {
    state = newState;
  }

  final loginFormGroup = FormGroup({
    'email': FormControl<String>(
        value: 'text@email.com', validators: [Validators.required]),
    'password': FormControl<String>(value: 'somepass123', validators: [
      Validators.required,
      Validators.minLength(6),
    ]),
  });

  final registerFormGroup = FormGroup(
    {
      'email': FormControl<String>(validators: [
        Validators.email,
        Validators.required,
      ]),
      'firstName': FormControl<String>(validators: [Validators.required]),
      'lastName': FormControl<String>(validators: [Validators.required]),
      'companyName': FormControl<String>(validators: [Validators.required]),
      'password': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(MyFacts.minPasswordLength),
      ]),
      'passwordConfirmation': FormControl<String>(validators: [
        Validators.required,
        Validators.minLength(MyFacts.minPasswordLength),
      ]),
    },
    validators: [
      const MustMatchValidator(
        'password',
        'passwordConfirmation',
        true,
      ),
    ],
  );

  Future<void> submit() async {
    final authNotifier = ref.read(authProvider.notifier);
    ref.read(asyncIsLoadingProvider.notifier).setLoading();
    state
        ? await authNotifier.signIn(
            email: loginFormGroup.control('email').value,
            password: loginFormGroup.control('password').value)
        : authNotifier.signUp(
            email: registerFormGroup.control('email').value,
            password: registerFormGroup.control('password').value,
          );
    ref.read(asyncIsLoadingProvider.notifier).setNotLoading();
  }
}

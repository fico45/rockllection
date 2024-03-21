import 'package:google_sign_in/google_sign_in.dart';
import 'package:rockllection/provider/async_loading/async_loading_provider.dart';
import 'package:rockllection/provider/auth/auth_provider.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rockllection/utils/api/api.dart';
import 'package:rockllection/utils/consts.dart';
import 'package:rockllection/utils/toast.dart';
import 'package:rockllection/utils/tokens.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  Future<AuthResponse?> googleSignIn() async {
    final supabase = ref.read(apiProvider);
    // Google sign in on Android will work without providing the Android
    // Client ID registered on Google Cloud.

    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: Tokens.iosClientId,
      serverClientId: Tokens.webClientId,
    );
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      ref.read(toastProvider).showToastMessage(
            message: 'Google sign-in cancelled',
            type: ToastType.error,
          );
      return null;
    }

    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      ref.read(toastProvider).showToastMessage(
            message: 'Google sign-in failed',
            type: ToastType.error,
          );
      return null;
    }
    if (idToken == null) {
      ref.read(toastProvider).showToastMessage(
            message: 'Google sign-in failed',
            type: ToastType.error,
          );
      return null;
    }

    return supabase.instance.auth.signInWithIdToken(
      provider: OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
  }
}

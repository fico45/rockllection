// Auth

import 'package:easy_localization/easy_localization.dart';

class AuthTr {
  LoginTr get login => const LoginTr();
  RegisterTr get register => const RegisterTr();
  ForgotPasswordTr get forgotPassword => const ForgotPasswordTr();
}

//Login

class LoginTr {
  const LoginTr();

  String get title => 'auth.login.title'.tr();
  String get signUp => 'auth.login.sign-up'.tr();
  String get forgotPassword => 'auth.login.forgot-password'.tr();

  LoginFormFieldsTr get fields => const LoginFormFieldsTr();
  LoginButtonTr get buttons => const LoginButtonTr();
  LoginRepositoryTr get repository => const LoginRepositoryTr();
}

class LoginFormFieldsTr {
  const LoginFormFieldsTr();

  String get email => 'auth.login.fields.email'.tr();
  String get password => 'auth.login.fields.password'.tr();
}

class LoginButtonTr {
  const LoginButtonTr();

  String get submit => 'auth.login.buttons.submit'.tr();
  String get goToRegister => 'auth.login.buttons.go-to-register'.tr();
  String get signUp => 'auth.login.buttons.sign-up'.tr();
}

class LoginRepositoryTr {
  const LoginRepositoryTr();

  String get error => 'auth.login.repository.error'.tr();
  String get success => 'auth.login.repository.success'.tr();
}

// Forgot Password

class ForgotPasswordTr {
  const ForgotPasswordTr();

  String get title => 'auth.forgot-password.title'.tr();
  String get goToLogin => 'auth.forgot-password.go-to-login'.tr();
  String get login => 'auth.forgot-password.login'.tr();

  ForgotPasswordFormFieldsTr get fields => const ForgotPasswordFormFieldsTr();
  ForgotPasswordButtonTr get buttons => const ForgotPasswordButtonTr();
  ForgotPasswordRepositoryTr get repository =>
      const ForgotPasswordRepositoryTr();
}

class ForgotPasswordFormFieldsTr {
  const ForgotPasswordFormFieldsTr();

  String get email => 'auth.forgot-password.fields.email'.tr();
}

class ForgotPasswordButtonTr {
  const ForgotPasswordButtonTr();

  String get submit => 'auth.forgot-password.buttons.submit'.tr();
}

class ForgotPasswordRepositoryTr {
  const ForgotPasswordRepositoryTr();

  String get error => 'auth.forgot-password.repository.error'.tr();
  String get success => 'auth.forgot-password.repository.success'.tr();
}

// Register

class RegisterTr {
  const RegisterTr();

  String get title => 'auth.register.title'.tr();
  String get login => 'auth.register.sign-in'.tr();

  RegisterFormFieldsTr get fields => const RegisterFormFieldsTr();
  RegisterButtonTr get buttons => const RegisterButtonTr();
  RegisterRepositoryTr get repository => const RegisterRepositoryTr();
}

class RegisterFormFieldsTr {
  const RegisterFormFieldsTr();

  String get email => 'auth.register.fields.email'.tr();
  String get firstName => 'auth.register.fields.first-name'.tr();
  String get lastName => 'auth.register.fields.last-name'.tr();
  String get password => 'auth.register.fields.password'.tr();
  String get confirmPassword => 'auth.register.fields.repeat-password'.tr();
}

class RegisterButtonTr {
  const RegisterButtonTr();

  String get submit => 'auth.register.buttons.submit'.tr();
  String get goToLogin => 'auth.register.buttons.go-to-login'.tr();
  String get login => 'auth.register.buttons.sign-in'.tr();
}

class RegisterRepositoryTr {
  const RegisterRepositoryTr();

  String get error => 'auth.register.repository.error'.tr();
  String get success => 'auth.register.repository.success'.tr();
}

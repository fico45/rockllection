import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';

/// Authentication class for this sample application.
/// It should be self-explanatory.
@freezed
sealed class AuthModel with _$AuthModel {
  const factory AuthModel.signedIn({
    required String id,
    required String displayName,
    required String email,
    required String token,
  }) = SignedIn;
  const AuthModel._();
  const factory AuthModel.signedOut() = SignedOut;
  bool get isAuth => switch (this) {
        SignedIn() => true,
        SignedOut() => false,
      };
  static AuthModel fromJson({
    required Map<String, dynamic> data,
  }) =>
      AuthModel.signedIn(
        id: data['member']['id'] ?? '',
        displayName:
            "${data['member']['firstName']} ${data['member']['lastName']}",
        email: data['member']['email'],
        token: data['token'] ?? '',
      );

  static AuthModel getUserFromJson({
    required Map<String, dynamic> data,
  }) =>
      AuthModel.signedIn(
        id: data['id'] ?? '',
        displayName: "${data['firstName']} ${data['lastName']}",
        email: data['email'],
        token: data['token'] ?? '',
      );
}

/* AuthModel fromJson({
  required Map<String, dynamic> data,
}) =>
    AuthModel.signedIn(
      id: data['member']['id'] ?? '',
      displayName:
          "${data['member']['firstName']} ${data['member']['lastName']}",
      email: data['member']['email'],
      token: data['token'] ?? '',
    ); */

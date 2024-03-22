import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';

@freezed
sealed class AuthModel with _$AuthModel {
  const factory AuthModel.signedIn({
    required String id,
    required String displayName,
    required String email,
    required String token,
    required String picture,
    required bool emailVerified,
  }) = SignedIn;
  const AuthModel._();
  const factory AuthModel.signedOut() = SignedOut;
  bool get isAuth => switch (this) {
        SignedIn() => true,
        SignedOut() => false,
      };
  static AuthModel fromJson({
    required Map<String, dynamic> data,
    required String token,
  }) =>
      AuthModel.signedIn(
        id: data['id'] ?? '',
        displayName: data['user_metadata']['full_name'] ?? '',
        email: data['email'] ?? '',
        token: data['token'] ?? '',
        picture: data['user_metadata']['picture'] ?? '',
        emailVerified: data['user_metadata']['email_verified'] ?? false,
      );
}

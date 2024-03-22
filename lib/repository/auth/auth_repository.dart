import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rockllection/provider/auth/token_provider.dart';
import 'package:rockllection/utils/api/api.dart';
import 'package:rockllection/utils/toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    AuthRepository(ref: ref);

class AuthRepository {
  AuthRepository({required this.ref});
  final Ref ref;
  Future<Response?> signUp({
    required String email,
    required String password,
  }) async {
    try {
      //ref.read(dioProvider)

      return null;
    } on DioException catch (e) {
      ref.read(toastProvider).showToastMessage(
            message: 'Neuspješna registracija',
            type: ToastType.error,
          );
      return e.response;
    }
  }

  Future<AuthResponse?> signInWithIdToken({
    required String idToken,
    required String accessToken,
  }) async {
    final supabase = ref.read(apiProvider);
    try {
      final response = await supabase.instance.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: accessToken,
      );

      return response;
    } on AuthException catch (e) {
      ref.read(toastProvider).showToastMessage(
            message: e.message,
            type: ToastType.error,
          );
      return null;
    }
  }

  Future<Response?> signInWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      /*   final response = await ref
          .read(apiProvider)
          .post('api/v1/integrations/ecommerce/members/login', {
        'username': email,
        'password': password,
      }); */

      return null;
    } on DioException catch (e) {
      ref.read(toastProvider).showToastMessage(
            message: 'Neuspješni Login',
            type: ToastType.error,
          );
      return e.response;
    }
  }

  Future signOut() async {
    await ref.read(apiProvider).instance.auth.signOut();
  }

  Future<AuthResponse?> getUser() async {
    final api = ref.read(apiProvider);
    try {
      final token = await ref.read(tokenProvider).fetchToken();
      if (token != null) {
        final response = await api.instance.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: token.idToken,
          accessToken: token.accessToken,
        );
        return response;
      }

      return null;
    } on AuthException catch (e) {
      ref.read(toastProvider).showToastMessage(
            message: e.message,
            type: ToastType.error,
          );
      return null;
    }
  }
}

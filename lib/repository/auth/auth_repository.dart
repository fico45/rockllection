import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_template/utils/api/api.dart';
import 'package:flutter_template/utils/toast.dart';

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

  Future<Response?> signInWithPassword({
    required String email,
    required String password,
  }) async {
    try {
      final response = await ref
          .read(apiProvider)
          .post('api/v1/integrations/ecommerce/members/login', {
        'username': email,
        'password': password,
      });

      return response;
    } on DioException catch (e) {
      ref.read(toastProvider).showToastMessage(
            message: 'Neuspješni Login',
            type: ToastType.error,
          );
      return e.response;
    }
  }

  Future<Response?> getUser() async {
    try {
      final response = await ref
          .read(apiProvider)
          .get('api/v1/integrations/ecommerce/members/me');

      return response;
    } on DioException catch (e) {
      ref.read(toastProvider).showToastMessage(
            message: 'Greška pri dohvaćanju korisnika',
            type: ToastType.error,
          );
      return e.response;
    }
  }
}

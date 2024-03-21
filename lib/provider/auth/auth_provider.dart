import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rockllection/model/auth_model.dart';
import 'package:rockllection/provider/app_auth_state/app_auth_state.dart';
import 'package:rockllection/provider/app_auth_state/app_auth_state_provider.dart';
import 'package:rockllection/provider/auth/token_provider.dart';
import 'package:rockllection/repository/auth/auth_repository.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthModel build() => const AuthModel.signedOut();

  AuthModel get user => state;

  Future<void> signIn({required String email, required String password}) async {
    final appState = ref.read(authStateProvider);
    /*  final response = await ref
        .read(authRepositoryProvider)
        .signInWithPassword(email: email, password: password);

    (response != null && response.statusCode == 200)
        ? {
            state = AuthModel.signedIn(
              id: response.data['member']['id'] ?? '',
              displayName:
                  "${response.data['member']['firstName']} ${response.data['member']['lastName']}",
              email: response.data['member']['email'],
              token: response.data['token'] ?? '',
            ),
            ref.read(tokenProviderProvider).saveToken(response.data['token']),
            ref.read(authStateProvider.notifier).changeAppState(
                  newState: const AppAuthState.authenticated(),
                )
          }
        : {
            state = const AuthModel.signedOut(),
            ref.read(authStateProvider.notifier).changeAppState(
                  newState: const AppAuthState.unauthenticated(),
                )
          }; */
    ref.read(authStateProvider.notifier).changeAppState(
          newState: const AppAuthState.authenticated(),
        );
  }

  Future signUp({required String email, required String password}) async {
    final response = await ref
        .read(authRepositoryProvider)
        .signUp(email: email, password: password);

    return response;
  }

  void signOut() async {
    ref.read(tokenProviderProvider).remove();
    state = const AuthModel.signedOut();
  }

  Future<AuthModel?> getUser() async {
    final token = await ref.read(tokenProviderProvider).fetchToken();
    if (token == null) {
      state = const AuthModel.signedOut();
      ref.read(authStateProvider.notifier).changeAppState(
            newState: const AppAuthState.unauthenticated(),
          );
      return null;
    }
    final response = await ref.read(authRepositoryProvider).getUser();
    if (response != null && response.statusCode == 200) {
      var responseWithToken = response.data;
      responseWithToken['token'] = token;
      state = AuthModel.getUserFromJson(data: responseWithToken);
      ref.read(authStateProvider.notifier).changeAppState(
            newState: const AppAuthState.authenticated(),
          );
    } else {
      state = const AuthModel.signedOut();
      ref.read(authStateProvider.notifier).changeAppState(
            newState: const AppAuthState.unauthenticated(),
          );
    }
    return state;
  }

  Future<AuthModel?> updateUser({required AuthModel newUser}) async {
    return null;
  }
}

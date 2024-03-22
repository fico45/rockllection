import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:rockllection/model/auth_model.dart';
import 'package:rockllection/provider/app_auth_state/app_auth_state.dart';
import 'package:rockllection/provider/app_auth_state/app_auth_state_provider.dart';
import 'package:rockllection/provider/auth/token_provider.dart';
import 'package:rockllection/repository/auth/auth_repository.dart';
import 'package:rockllection/utils/api/api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthModel build() {
    ref.read(apiProvider).instance.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        ref
            .read(authStateProvider.notifier)
            .changeAppState(newState: const AppAuthState.authenticated());
        state = AuthModel.signedIn(
          id: data.session?.user.id ?? '',
          displayName: data.session?.user.aud ?? '',
          email: data.session?.user.email! ?? '',
          token: data.session?.accessToken ?? '',
          picture: data.session?.user.userMetadata?['picture'] ?? '',
          emailVerified:
              data.session?.user.userMetadata?['emailVerified'] ?? false,
        );
      }
      if (event == AuthChangeEvent.signedOut) {
        ref
            .read(authStateProvider.notifier)
            .changeAppState(newState: const AppAuthState.unauthenticated());
        state = const AuthModel.signedOut();
      }
    });
    return state;
  }

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

  Future signUp({
    required String email,
    required String password,
  }) async {
    final response = await ref
        .read(authRepositoryProvider)
        .signUp(email: email, password: password);

    return response;
  }

  Future signInViaGoogle({
    required String idToken,
    required String accessToken,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    final response = await repository.signInWithIdToken(
        idToken: idToken, accessToken: accessToken);
    if (response != null) {
      ref
          .read(tokenProvider)
          .saveToken(idToken: idToken, accessToken: accessToken);
    }
  }

  void signOut() async {
    await ref.read(tokenProvider).remove();
    await ref.read(authRepositoryProvider).signOut();
    state = const AuthModel.signedOut();
  }

  Future<AuthModel?> getUser() async {
    final token = await ref.read(tokenProvider).fetchToken();
    if (token == null) {
      state = const AuthModel.signedOut();
      ref.read(authStateProvider.notifier).changeAppState(
            newState: const AppAuthState.unauthenticated(),
          );
      return null;
    }
    final response = await ref.read(authRepositoryProvider).getUser();
    if (response != null && response.user != null) {
      state = AuthModel.fromJson(
          data: response.user!.toJson(), token: token.idToken);
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

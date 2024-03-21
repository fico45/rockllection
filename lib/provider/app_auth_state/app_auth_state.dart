import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_auth_state.freezed.dart';

@freezed
class AppAuthState with _$AppAuthState {
  const AppAuthState._();

  const factory AppAuthState.initial() = _Initial;
  const factory AppAuthState.unauthenticated() = Unauthenticated;
  const factory AppAuthState.internetUnAvailable() = _InternetUnAvailable;
  const factory AppAuthState.authenticated() = AppAuthenticated;
  const factory AppAuthState.error(Exception error) = _Error;

  bool get isAuthenticated =>
      maybeWhen(authenticated: () => true, orElse: () => false);
}

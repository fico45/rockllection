import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_start_state.freezed.dart';

@freezed
class AppStartState with _$AppStartState {
  const AppStartState._();

  const factory AppStartState.initial() = _Initial;
  const factory AppStartState.unauthenticated() = Unauthenticated;
  const factory AppStartState.internetUnAvailable() = _InternetUnAvailable;
  const factory AppStartState.authenticated() = AppAuthenticated;
  const factory AppStartState.error(Exception error) = _Error;

  bool get isAuthenticated =>
      maybeWhen(authenticated: () => true, orElse: () => false);
}

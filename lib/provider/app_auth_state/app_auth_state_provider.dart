import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rockllection/provider/app_auth_state/app_auth_state.dart';
import 'package:rockllection/provider/auth/auth_provider.dart';
import 'package:rockllection/provider/splash/splash_provider.dart';

part 'app_auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  AppAuthState build() => const AppAuthState.initial();

  Future<void> initApp() async {
    final auth = ref.read(authProvider.notifier);
    /* final notificationPermission =
      ref.read(notificationPermissionProvider.notifier); */
    final notificatonPermission = await Permission.notification.request();
    print('INIT notification permission status is $notificatonPermission');
    final authUser = await auth.getUser();
    if (authUser != null && authUser.isAuth) {
      state = const AppAuthState.authenticated();
    } else {
      state = const AppAuthState.unauthenticated();
    }

    ref.read(splashProvider.notifier).finishSplash();
    FlutterNativeSplash.remove();
    // await handleInitialNavigation();

    // await notificationPermission.getPermission();
  }

  void changeAppState({required AppAuthState newState}) {
    state = newState;
  }
}

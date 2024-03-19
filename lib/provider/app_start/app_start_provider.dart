import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_template/provider/app_start/app_start_state.dart';
import 'package:flutter_template/provider/auth/auth_provider.dart';
import 'package:flutter_template/provider/splash/splash_provider.dart';

part 'app_start_provider.g.dart';

@Riverpod(keepAlive: true)
class AppStart extends _$AppStart {
  @override
  AppStartState build() => const AppStartState.initial();

  Future<void> initApp() async {
    final auth = ref.read(authProvider.notifier);
    /* final notificationPermission =
      ref.read(notificationPermissionProvider.notifier); */
    final notificatonPermission = await Permission.notification.request();
    print('INIT notification permission status is $notificatonPermission');
    final authUser = await auth.getUser();
    if (authUser != null && authUser.isAuth) {
      state = const AppStartState.authenticated();
    } else {
      state = const AppStartState.unauthenticated();
    }

    ref.read(splashProvider.notifier).finishSplash();
    FlutterNativeSplash.remove();
    // await handleInitialNavigation();

    // await notificationPermission.getPermission();
  }

  void changeAppState({required AppStartState newState}) {
    state = newState;
  }
}

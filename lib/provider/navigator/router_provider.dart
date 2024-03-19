import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_template/modules/home/home.dart';
import 'package:flutter_template/provider/navigator/navigator_key_provider.dart';
import 'package:flutter_template/modules/auth/auth_screen.dart';
import 'package:flutter_template/modules/debugTest/debugTest.dart';
import 'package:flutter_template/modules/splash/splash_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);

  return GoRouter(
    navigatorKey: navigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppStartScreen.routeLocation,
    routes: [
      GoRoute(
        path: AppStartScreen.routeLocation,
        name: AppStartScreen.routeName,
        builder: (context, state) {
          return const AppStartScreen();
        },
      ),
      GoRoute(
        path: DebugTest.routeLocation,
        name: DebugTest.routeName,
        builder: (context, state) {
          return const DebugTest();
        },
      ),
      GoRoute(
        path: Home.routeLocation,
        name: Home.routeName,
        builder: (context, state) {
          return const Home();
        },
        routes: [],
      ),
      GoRoute(
        path: AuthScreen.routeLocation,
        name: AuthScreen.routeName,
        builder: (context, state) {
          return const AuthScreen();
        },
      ),
    ],
    /* redirect: (context, state) {
      final isAuth = ref.watch(authProvider).isAuth;
      final isSplashDone = ref.watch(splashProvider.notifier).isSplashDone;
      print('Router is auth: $isAuth');
      print('Router is splash done: $isSplashDone');
      final isSplash = state.uri.toString() == AppStartScreen.routeLocation;
      if (!isSplashDone) return AppStartScreen.routeLocation;
      if (isSplash) {
        return isAuth ? HomePage.routeLocation : AuthPage.routeLocation;
      }

/*       final isLoggingIn = state.uri.toString() == AuthPage.routeLocation;
      if (isLoggingIn) return isAuth ? HomePage.routeLocation : null; */

      return isAuth ? HomePage.routeLocation : AppStartScreen.routeLocation;
    }, */
  );
}

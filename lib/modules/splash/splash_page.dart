import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rockllection/modules/auth/auth_screen.dart';
import 'package:rockllection/modules/home/home.dart';
import 'package:rockllection/provider/app_auth_state/app_auth_state_provider.dart';
import 'package:rockllection/utils/extensions.dart';
import 'package:rockllection/utils/translations/translations.dart';

class AppStartScreen extends ConsumerStatefulWidget {
  const AppStartScreen({super.key});
  static String get routeName => 'appStart';
  static String get routeLocation => '/';
  static String get title => MyTranslations.home.title;

  @override
  ConsumerState<AppStartScreen> createState() => _AppStartScreenState();
}

class _AppStartScreenState extends ConsumerState<AppStartScreen> {
  @override
  void initState() {
    ref.read(authStateProvider.notifier).initApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authStateProvider);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: state.when(
        initial: () => Scaffold(
          backgroundColor: context.colorScheme.background,
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
        authenticated: () => const Home(),
        unauthenticated: () {
          return const AuthScreen();
        },
        internetUnAvailable: () => ColoredBox(
          color: context.colorScheme.background,
        ),
        error: (e) {
          return Scaffold(
            backgroundColor: context.colorScheme.background,
            body: const Center(
              child: Text('Something went wrong. Please reload the app.'),
            ),
          );
        },
      ),
    );
  }
}

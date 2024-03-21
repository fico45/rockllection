import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rockllection/provider/navigator/router_provider.dart';
import 'package:rockllection/provider/theme/theme_provider.dart';
import 'package:rockllection/theme/theme_data.dart';
import 'package:rockllection/utils/storage/prefs.dart';
import 'package:rockllection/utils/state_logger.dart';
import 'package:rockllection/utils/tokens.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  const locale = Locale('en', 'EN');
  await EasyLocalization.ensureInitialized();
  await Tokens.loadTokens();
  await Prefs.initializePrefs();
  await Supabase.initialize(
      url: Tokens.supabaseUrl, anonKey: Tokens.supabaseAnonKey);

  runApp(
    ProviderScope(
      observers: const [
        StateLogger(),
      ],
      child: EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [locale],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Rockllection',
      onGenerateRoute: (settings) =>
          MaterialWithModalsPageRoute(builder: (context) {
        final router = ref.watch(routerProvider);

        return MaterialApp.router(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          title: 'Rockllection',
          themeMode: ref.watch(themeProvider),
          theme: CustomTheme.light,
          darkTheme: CustomTheme.dark,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
        );
      }),
      theme: CustomTheme.light,
      darkTheme: CustomTheme.dark,
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/provider/navigator/router_provider.dart';
import 'package:flutter_template/provider/theme/theme_provider.dart';
import 'package:flutter_template/theme/theme_data.dart';
import 'package:flutter_template/utils/storage/prefs.dart';
import 'package:flutter_template/utils/state_logger.dart';
import 'package:flutter_template/utils/tokens.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  const locale = Locale('en', 'EN');
  await EasyLocalization.ensureInitialized();
  await Tokens.loadTokens();
  await Prefs.initializePrefs();

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
      title: 'Flutter template',
      onGenerateRoute: (settings) =>
          MaterialWithModalsPageRoute(builder: (context) {
        final router = ref.watch(routerProvider);

        return MaterialApp.router(
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          title: 'Flutter template',
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

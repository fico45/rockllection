import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/modules/debugTest/debugTest.dart';
import 'package:flutter_template/modules/home/widgets/navigation_bar.dart';
import 'package:flutter_template/modules/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:flutter_template/modules/widgets/buttons/button.dart';
import 'package:flutter_template/modules/widgets/scaffold/my_app_bar.dart';
import 'package:flutter_template/modules/widgets/scaffold/my_scaffold.dart';
import 'package:flutter_template/provider/home/home_navigation_provider.dart';
import 'package:flutter_template/utils/translations/translations.dart';

class Home extends ConsumerWidget {
  const Home({super.key});
  static String get routeName => 'home';
  static String get routeLocation => '/home';
  static String get title => MyTranslations.home.title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(homeNavigationProvider);

    return MyScaffold(
      appBar: MyAppBar(
        title: () {
          switch (currentIndex) {
            case 0:
              return MyTranslations.home.tabs.tab1;
            case 1:
              return MyTranslations.home.tabs.tab2;
            case 2:
              return MyTranslations.home.tabs.tab3;
            case 3:
              return MyTranslations.home.tabs.tab4;
            default:
              return '';
          }
        }(),
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        child: switch (currentIndex) {
          0 => Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Button(
                onPressed: () async {
                  await MyBottomSheet.showBottomSheet(
                    context: context,
                    content: Text('Hello'),
                  );
                },
                child: 'Show Modal',
              ),
            )),
          1 => Center(
              child: Text('Settings page'),
            ),
          2 => Center(
              child: Text('Scan page'),
            ),
          3 => DebugTest(),
          // TODO: Handle this case.
          int() => null,
        },
      ),
    );
  }
}

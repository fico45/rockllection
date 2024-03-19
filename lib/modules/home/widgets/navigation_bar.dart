import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/provider/home/home_navigation_provider.dart';
import 'package:flutter_template/provider/theme/theme_provider.dart';
import 'package:flutter_template/utils/extensions.dart';
import 'package:flutter_template/utils/translations/translations.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final currentIndex = ref.watch(homeNavigationProvider);
    const double iconSize = 25;

    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: Colors.transparent,
      selectedItemColor: theme == ThemeMode.dark
          ? context.colorScheme.primary
          : context.colorScheme.tertiary,
      unselectedItemColor: theme == ThemeMode.dark
          ? context.colorScheme.tertiary
          : context.colorScheme.primary,
      onTap: (value) async {
        ref.read(homeNavigationProvider.notifier).setIndex(newIndex: value);
      },
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.home,
            size: iconSize,
          ),
          label: MyTranslations.home.tabs.tab1,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.handyman,
            size: iconSize,
          ),
          label: MyTranslations.home.tabs.tab2,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.qr_code,
            size: iconSize,
          ),
          label: MyTranslations.home.tabs.tab3,
        ),
        BottomNavigationBarItem(
          icon: const Icon(
            Icons.person,
            size: iconSize,
          ),
          label: MyTranslations.home.tabs.tab4,
        ),
      ],
    );
  }
}

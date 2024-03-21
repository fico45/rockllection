import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rockllection/modules/profile/widgets/profile_list_item.dart';
import 'package:rockllection/provider/theme/theme_provider.dart';
import 'package:rockllection/utils/consts.dart';
import 'package:rockllection/utils/extensions.dart';
import 'package:rockllection/utils/translations/translations.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  static String get routeName => 'profile';
  static String get routeLocation => '/profile';
  static String get title => MyTranslations.profile.title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return Padding(
      padding: MyFacts.padding.screedHorizontalPadding,
      child: Column(
        children: [
          Text(title,
              style: context.textTheme.headlineMedium?.copyWith(
                color: context.colorScheme.onBackground,
              )),
          const Spacer(),
          Text(
            'Profile Screen',
            style: context.textTheme.bodyLarge?.copyWith(
              color: context.colorScheme.onBackground,
            ),
          ),
          SizedBox(
            height: MyFacts.size.sizeM,
          ),
          ProfileListItem(
            title: 'profile.items.notification-settings'.tr(),
            onTap: () {},
          ),
          SizedBox(
            height: MyFacts.size.sizeM,
          ),
          ProfileListItem(
            title: 'profile.items.theme-settings'.tr(),
            onTap: () {},
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

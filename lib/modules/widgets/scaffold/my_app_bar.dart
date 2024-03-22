import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rockllection/modules/widgets/circle_avatar/circle_avatar.dart';
import 'package:rockllection/provider/auth/auth_provider.dart';
import 'package:rockllection/utils/consts.dart';
import 'package:rockllection/utils/extensions.dart';

class MyAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const MyAppBar({required this.title, this.actions, super.key});
  final List<Widget>? actions;
  final String title;

  @override
  Size get preferredSize => Size.fromHeight(
        MyFacts.layout.appBarHeight,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authProvider);
    return AppBar(
      backgroundColor: context.colorScheme.background,
      title: Text(
        title,
        style: context.textTheme.bodyLarge!.copyWith(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        if (actions != null) ...actions!,
        user.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          signedIn: (id, displayName, email, token, picture, emailVerified) {
            return MyCircleAvatar(picture: picture);
          },
        ),
      ],
    );
  }
}

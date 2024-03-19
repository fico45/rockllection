import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/utils/consts.dart';
import 'package:flutter_template/utils/extensions.dart';

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
    return AppBar(
      backgroundColor: context.colorScheme.background,
      title: Text(
        title,
        style: context.textTheme.bodyLarge!.copyWith(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
    );
  }
}

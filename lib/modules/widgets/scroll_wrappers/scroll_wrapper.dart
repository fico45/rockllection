import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rockllection/utils/consts.dart';

class ScrollWrapper extends StatelessWidget {
  const ScrollWrapper({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final isAndroid = Platform.isAndroid;
    return Scrollbar(
      child: CustomScrollView(
        physics: MyFacts.scroll.scrollPhysics,
        slivers: [
          SliverFillRemaining(hasScrollBody: false, child: child),
        ],
      ),
    );
  }
}

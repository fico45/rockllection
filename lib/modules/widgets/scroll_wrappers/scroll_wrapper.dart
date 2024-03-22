import 'package:flutter/material.dart';
import 'package:rockllection/utils/consts.dart';

class ScrollWrapper extends StatelessWidget {
  const ScrollWrapper(
      {required this.child, this.overrideScrollBody = false, super.key});
  final Widget child;
  final bool overrideScrollBody;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: CustomScrollView(
        physics: MyFacts.scroll.scrollPhysics,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: overrideScrollBody,
            child: child,
          ),
        ],
      ),
    );
  }
}

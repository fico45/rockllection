import 'package:flutter/material.dart';
import 'package:flutter_template/utils/consts.dart';

class ScrollWrapper extends StatelessWidget {
  const ScrollWrapper({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
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

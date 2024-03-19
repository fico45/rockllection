import 'package:flutter/cupertino.dart';
import 'package:flutter_template/utils/consts.dart';

class RefreshableScrollWrapper extends StatelessWidget {
  const RefreshableScrollWrapper({
    required this.child,
    required this.onRefresh,
    this.controller,
    super.key,
  });
  final Widget child;
  final Future<void> Function() onRefresh;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: MyFacts.scroll.scrollPhysics,
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
          builder: (context, refreshState, pulledExtent,
              refreshTriggerPullDistance, refreshIndicatorExtent) {
            return CupertinoSliverRefreshControl.buildRefreshIndicator(
              context,
              refreshState,
              pulledExtent,
              refreshTriggerPullDistance,
              refreshIndicatorExtent,
            );
          },
        ),
        SliverFillRemaining(hasScrollBody: false, child: child),
      ],
    );
  }
}

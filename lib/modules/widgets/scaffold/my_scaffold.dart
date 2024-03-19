import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/provider/async_loading/async_loading_provider.dart';
import 'package:flutter_template/utils/extensions.dart';

class MyScaffold extends ConsumerWidget {
  const MyScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.appBar,
    this.fab,
  });

  final Widget body;
  final Widget? bottomNavigationBar;
  final PreferredSizeWidget? appBar;
  final Widget? fab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(asyncIsLoadingProvider);

    return Stack(
      children: [
        Scaffold(
          backgroundColor: context.colorScheme.background,
          bottomNavigationBar: bottomNavigationBar,
          appBar: appBar,
          floatingActionButton: fab,
          body: body,
        ),
        if (isLoading)
          Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: context.colorScheme.background,
            ),
          ),
        if (isLoading)
          Center(
            child: CircularProgressIndicator(
              color: context.colorScheme.primary,
            ),
          ),
      ],
    );
  }
}

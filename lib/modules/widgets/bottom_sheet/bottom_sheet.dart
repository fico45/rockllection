import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/modules/widgets/scroll_wrappers/scroll_wrapper.dart';
import 'package:flutter_template/utils/consts.dart';
import 'package:flutter_template/utils/extensions.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyBottomSheet {
  static Future<dynamic> showBottomSheet({
    required BuildContext context,
    required Widget content,
  }) {
    const topBorderRadius = Radius.circular(25.0);

    if (Platform.isIOS) {
      return showCupertinoModalBottomSheet(
        context: context,
        expand: false,
        isDismissible: true,
        enableDrag: false,
        useRootNavigator: true,
        bounce: true,
        builder: (context) => Material(
          borderRadius: const BorderRadius.vertical(top: topBorderRadius),
          color: context.colorScheme.background,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SheetAppBar(),
              Expanded(
                child: ScrollWrapper(
                  child: Column(
                    children: [
                      content,
                      for (int i = 0; i < 20; i++) ...[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(height: 50, color: Colors.blue),
                        ),
                      ],
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        barrierColor: context.colorScheme.onBackground.withOpacity(0.25),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: topBorderRadius),
        ),
        builder: (context) {
          return Material(
            borderRadius: const BorderRadius.vertical(top: topBorderRadius),
            color: context.colorScheme.background,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SheetAppBar(),
                Expanded(
                  child: ScrollWrapper(
                    child: Column(
                      children: [
                        content,
                        for (int i = 0; i < 20; i++) ...[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(height: 50, color: Colors.blue),
                          ),
                        ],
                        SizedBox(
                          height: MediaQuery.of(context).viewInsets.bottom,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}

class SheetAppBar extends StatelessWidget {
  const SheetAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.tertiary,
        borderRadius: Platform.isIOS
            ? null
            : const BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0),
              ),
      ),
      height: MyFacts.layout.appBarHeight,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}

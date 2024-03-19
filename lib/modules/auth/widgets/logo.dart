import 'package:flutter/material.dart';
import 'package:flutter_template/utils/consts.dart';
import 'package:flutter_template/utils/extensions.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyFacts.size.sizeXL,
      width: MyFacts.size.sizeXXL * 2,
      decoration: BoxDecoration(
        color: context.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
          child: Text('Your logo here',
              style: context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ))),
    );
  }
}

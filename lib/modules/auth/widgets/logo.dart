import 'package:flutter/material.dart';
import 'package:rockllection/utils/consts.dart';
import 'package:rockllection/utils/extensions.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MyFacts.size.sizeXS,
        horizontal: MediaQuery.of(context).size.width * 0.2,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MyFacts.size.sizeXS,
            horizontal: MyFacts.size.sizeM,
          ),
          child: Center(
            child: Text(
              'Your logo here',
              style: context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:rockllection/utils/extensions.dart';

class MyCircleAvatar extends StatelessWidget {
  const MyCircleAvatar({required this.picture, super.key});
  final String picture;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: CircleBorder(
        side: BorderSide(
          color: context.colorScheme.tertiary,
          width: 2,
        ),
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(picture),
      ),
    );
    ;
  }
}

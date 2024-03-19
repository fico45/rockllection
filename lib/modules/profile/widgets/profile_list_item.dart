import 'package:flutter/material.dart';
import 'package:flutter_template/utils/consts.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final Function()? onTap;

  static final borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
        child: InkWell(
          borderRadius: borderRadius,
          radius: MyFacts.size.sizeXS,
          onTap: onTap,
          child: SizedBox(
            height: MyFacts.size.sizeXL,
            child: Padding(
              padding: MyFacts.padding.screedHorizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

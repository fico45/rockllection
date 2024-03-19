import 'package:flutter/material.dart';

class MyFacts {
  static const int minPasswordLength = 6;
  static MySize size = const MySize();
  static MyPadding padding = const MyPadding();
  static MyLayout layout = const MyLayout();
  static MyScroll scroll = const MyScroll();
}

class MySize {
  const MySize();
  double get sizeXXS => 4.0;
  double get sizeXS => 8.0;
  double get sizeS => 16.0;
  double get sizeM => 24.0;
  double get sizeL => 32.0;
  double get sizeXL => 48.0;
  double get sizeXXL => 64.0;

  static const double buttonLoadingIndicatorSize = 25;
}

class MyPadding {
  const MyPadding();
  EdgeInsets get formPadding => const EdgeInsets.symmetric(horizontal: 22.0);
  EdgeInsets get formLabelPadding => const EdgeInsets.only(bottom: 0);
  EdgeInsets get screedHorizontalPadding =>
      EdgeInsets.symmetric(horizontal: MyFacts.size.sizeXS);

  EdgeInsets get buttonContentPadding => EdgeInsets.symmetric(
        horizontal: MyFacts.size.sizeS,
        vertical: MyFacts.size.sizeS,
      );

  double get topSafeAreaPadding => 0.0;
  double get bottomSafeAreaPadding => 0.0;
}

class MyLayout {
  const MyLayout();
  double get appBarHeight => 60;
}

class MyScroll {
  const MyScroll();
  ScrollPhysics get scrollPhysics => const BouncingScrollPhysics()
      .applyTo(const AlwaysScrollableScrollPhysics());
}

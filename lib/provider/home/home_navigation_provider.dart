import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_navigation_provider.g.dart';

@riverpod
class HomeNavigation extends _$HomeNavigation {
  @override
  int build() => 0;

  int get homeNavigation => state;

  void setIndex({required int newIndex}) {
    state = newIndex;
  }
}

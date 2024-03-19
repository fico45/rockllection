import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

@Riverpod(keepAlive: true)
class Splash extends _$Splash {
  @override
  bool build() => false;

  bool get isSplashDone => state;

  void finishSplash() {
    state = true;
  }
}

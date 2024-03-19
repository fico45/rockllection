import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'async_loading_provider.g.dart';

@Riverpod(keepAlive: true)
class AsyncIsLoading extends _$AsyncIsLoading {
  @override
  bool build() => false;

  void setNotLoading() {
    state = false;
  }

  void setLoading() {
    state = true;
  }
}

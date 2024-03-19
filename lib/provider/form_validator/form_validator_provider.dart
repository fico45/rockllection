import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_validator_provider.g.dart';

@riverpod
class FormValidator extends _$FormValidator {
  @override
  bool build() => false;

  void updateValidity({required bool isValid}) {
    state = isValid;
  }
}

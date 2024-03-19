import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_template/utils/consts.dart';

class ValidationTr {
  const ValidationTr();

  String get required => 'validation.required'.tr();
  String get email => 'validation.email'.tr();
  String get passwordMinLength => 'validation.password-minLength'.tr(
        args: [
          MyFacts.minPasswordLength.toString(),
        ],
      );
  String get passwordMustMatch => 'validation.must-match-password'.tr();
  String get photosEmpty => 'validation.photos-empty'.tr();
}

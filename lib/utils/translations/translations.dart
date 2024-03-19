import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_template/utils/translations/auth/auth_translation.dart';
import 'package:flutter_template/utils/translations/button_state/button_state_translation.dart';
import 'package:flutter_template/utils/translations/form_blocking_modal/form_blocking_modal_translations.dart';
import 'package:flutter_template/utils/translations/home/home_translations.dart';
import 'package:flutter_template/utils/translations/profile/profile_translations.dart';
import 'package:flutter_template/utils/translations/validation/validation_translation.dart';

class MyTranslations {
  static String get appName => 'appName'.tr();

  static AuthTr get auth => AuthTr();
  static HomeTr get home => const HomeTr();
  static ProfileTr get profile => const ProfileTr();
  static ValidationTr get validation => const ValidationTr();
  static ButtonStateTr get buttonState => const ButtonStateTr();
  static BlockingModalTr get blockingModal => const BlockingModalTr();
}

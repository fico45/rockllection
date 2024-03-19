import 'package:easy_localization/easy_localization.dart';

class BlockingModalTr {
  const BlockingModalTr();

  static const DeleteAccountTr deleteAccount = DeleteAccountTr();
  static const LogoutTr logout = LogoutTr();
}

class DeleteAccountTr {
  const DeleteAccountTr();

  static String get title => "form-blocking-modal.delete-account.title".tr();
  static String get content =>
      "form-blocking-modal.delete-account.content".tr();
  static String get confirmButton =>
      "form-blocking-modal.delete-account.buttons.confirm".tr();
  static String get cancelButton =>
      "form-blocking-modal.delete-account.buttons.cancel".tr();
}

class LogoutTr {
  const LogoutTr();

  static String get title => "form-blocking-modal.logout.title".tr();
  static String get content => "form-blocking-modal.logout.content".tr();
  static String get confirmButton =>
      "form-blocking-modal.logout.buttons.confirm".tr();
  static String get cancelButton =>
      "form-blocking-modal.logout.buttons.cancel".tr();
}

import 'package:easy_localization/easy_localization.dart';

class ProfileTr {
  const ProfileTr();

  String get title => 'profile.title'.tr();
  ProfileFieldsTr get tabs => const ProfileFieldsTr();
  ProfileButtonsTr get buttons => const ProfileButtonsTr();
  ProfileRepositoryTr get repository => const ProfileRepositoryTr();
  ThemeToggleTr get themeToggle => const ThemeToggleTr();
}

class ProfileFieldsTr {
  const ProfileFieldsTr();

  String get firstName => 'profile.fields.first-name'.tr();
  String get lastName => 'profile.fields.last-name'.tr();
  String get email => 'profile.fields.email'.tr();
  String get password => 'profile.fields.password'.tr();
  String get confirmPassword => 'profile.fields.repeat-password'.tr();
}

class ProfileButtonsTr {
  const ProfileButtonsTr();

  String get save => 'profile.buttons.save'.tr();
}

class ThemeToggleTr {
  const ThemeToggleTr();

  String get title => 'profile.theme-toggle.title'.tr();
  String get light => 'profile.theme-toggle.light'.tr();
  String get dark => 'profile.theme-toggle.dark'.tr();
}

class ProfileRepositoryTr {
  const ProfileRepositoryTr();

  String get putSuccess => 'profile.repository.put-success'.tr();
  String get putError => 'profile.repository.put-error'.tr();
  String get deleteSuccess => 'profile.repository.delete-success'.tr();
  String get deleteError => 'profile.repository.delete-error'.tr();
}

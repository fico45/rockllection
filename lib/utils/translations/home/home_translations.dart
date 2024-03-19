import 'package:easy_localization/easy_localization.dart';

class HomeTr {
  const HomeTr();

  String get title => 'home.title'.tr();
  HomeTabsTr get tabs => const HomeTabsTr();
  SettingsTr get settings => const SettingsTr();
}

class HomeTabsTr {
  const HomeTabsTr();

  String get tab1 => 'home.tabs.1'.tr();
  String get tab2 => 'home.tabs.2'.tr();
  String get tab3 => 'home.tabs.3'.tr();
  String get tab4 => 'home.tabs.4'.tr();
}

class SettingsTr {
  const SettingsTr();

  String get title => 'home.settings.title'.tr();
  SettingsItemsTr get items => const SettingsItemsTr();
}

class SettingsItemsTr {
  const SettingsItemsTr();

  String get company => 'home.settings.items.company'.tr();
  String get users => 'home.settings.items.users'.tr();
  String get logout => 'home.settings.items.logout'.tr();
}

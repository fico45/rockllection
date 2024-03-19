import 'package:flutter/material.dart';
import 'package:flutter_template/utils/storage/secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static late SharedPreferences _instance;

  static get instance => _instance;

  static Future<void> initializePrefs() async {
    _instance = await SharedPreferences.getInstance();
    await _checkToClearSecureStorage();
  }

  static Future<void> _checkToClearSecureStorage() async {
    if (_instance.getBool('clearSecureStorage') ?? true) {
      await SecureStorage.clear();
      await _instance.setBool('clearSecureStorage', false);
    }
  }

  static Future<void> saveThemeMode(ThemeMode themeMode) async {
    await _instance.setString('themeMode', themeMode.toString());
  }

  static ThemeMode loadThemeMode() {
    String theme = _instance.getString('themeMode') ?? 'ThemeMode.system';

    return theme == 'ThemeMode.light'
        ? ThemeMode.light
        : theme == 'ThemeMode.dark'
            ? ThemeMode.dark
            : ThemeMode.system;
  }
}

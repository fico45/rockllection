import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_template/utils/storage/prefs.dart';
import 'package:flutter_template/utils/toast.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class Theme extends _$Theme {
  @override
  ThemeMode build() => Prefs.loadThemeMode();

  void toggleThemeMode() async {
    if (state == ThemeMode.system) {
      state = ThemeMode.light;

      ref.read(toastProvider).showToastMessage(message: 'Light theme selected');
    } else if (state == ThemeMode.light) {
      state = ThemeMode.dark;
      ref.read(toastProvider).showToastMessage(message: 'Dark theme selected');
    } else {
      state = ThemeMode.system;
      ref
          .read(toastProvider)
          .showToastMessage(message: 'System theme selected');
    }

    await Prefs.saveThemeMode(state);
  }
}

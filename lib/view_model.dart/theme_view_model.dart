import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:innoscripta_project/service/local_storage.dart';

final themeViewModelProvider = ChangeNotifierProvider((ref) {
  return ThemeViewModel(ref.watch(localStorageProvider));
});

enum AppColor {
  cyan(Color(0xff38A09D)),
  red(Color(0xffdb4035)),
  taupe(Color(0xffccac93));

  final Color value;
  const AppColor(this.value);
}

class ThemeViewModel extends ChangeNotifier {
  final LocalStorage localStorage;
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode newMode) {
    _themeMode = newMode;
    localStorage.setThemeMode(newMode);
    notifyListeners();
  }

  late AppColor _color;
  AppColor get color => _color;
  set color(AppColor newColor) {
    _color = newColor;
    localStorage.setAppColor(newColor);
    notifyListeners();
  }

  ThemeViewModel(
    this.localStorage,
  ) {
    _color = localStorage.getAppColor() ?? AppColor.cyan;
    _themeMode = localStorage.getThemeMode() ?? ThemeMode.system;
  }
}

extension on LocalStorage {
  AppColor? getAppColor() {
    final colorName = getString('color');
    if (colorName == null) return null;
    return AppColor.values
        .firstWhereOrNull((element) => element.name == colorName);
  }

  ThemeMode? getThemeMode() {
    final themeModeName = getString('theme_mode');
    if (themeModeName == null) return null;
    return ThemeMode.values
        .firstWhereOrNull((element) => element.name == themeModeName);
  }

  Future<bool> setAppColor(AppColor color) {
    return setString('color', color.name);
  }

  Future<bool> setThemeMode(ThemeMode mode) {
    return setString('theme_mode', mode.name);
  }
}

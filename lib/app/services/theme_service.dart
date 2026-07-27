// lib/app/services/theme_service.dart

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeService {
  static const String _themeKey = 'theme_mode';

  // সিঙ্গেলটন প্যাটার্ন
  static final ThemeService _instance = ThemeService._internal();
  factory ThemeService() => _instance;
  ThemeService._internal();

  final _box = GetStorage();

  // এটাই মূল চেঞ্জ: ValueNotifier দিয়ে reactive করা হলো
  final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

  // প্রথমবার লোড করার সময় notifier আপডেট করো
  ThemeMode get theme {
    final mode = _loadThemeFromBox();
    themeNotifier.value = mode; // notifier কে সিঙ্ক রাখো
    return mode;
  }

  ThemeMode _loadThemeFromBox() {
    final String? saved = _box.read(_themeKey);
    switch (saved) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  Future<void> switchTheme(ThemeMode themeMode) async {
    await _box.write(_themeKey, _themeModeToString(themeMode));
    Get.changeThemeMode(themeMode);

    // এটাই UI রিবিল্ড করাবে
    themeNotifier.value = themeMode;
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  ThemeMode stringToThemeMode(String value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }
}
import 'package:flutter/material.dart';
import '../core/utils/theme_preferences.dart';

class ThemeController {
  static final ValueNotifier<ThemeMode> themeMode =  ValueNotifier(ThemeMode.light);

  static Future<void> initialize() async {
    themeMode.value = await ThemePreferences.loadThemeMode();
  }

  static Future<void> toggleTheme() async {
    final newMode =
    themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    themeMode.value = newMode;
    await ThemePreferences.saveThemeMode(newMode);
  }
}

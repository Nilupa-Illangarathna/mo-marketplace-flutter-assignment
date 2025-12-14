import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemePreferences {
  static const String _themeKey = 'app_theme_mode';

  /// Save theme mode
  static Future<void> saveThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _themeKey,
      mode == ThemeMode.dark ? 'dark' : 'light',
    );
  }

  /// Load theme mode
  static Future<ThemeMode> loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(_themeKey);

    if (value == 'dark') return ThemeMode.dark;
    return ThemeMode.light;
  }
}

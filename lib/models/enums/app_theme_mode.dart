import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/theme/app_theme_data.dart';
import 'package:todo_flutter_training/theme/app_theme_interface.dart';

enum AppThemeMode { system, light, dark }

extension AppThemeModeExtension on AppThemeMode {
  ThemeMode get flutterThemeMode {
    switch (this) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  AppThemeData themeData({
    required DarkThemeData darkTheme,
    required LightThemeData lightTheme,
  }) {
    switch (this) {
      case AppThemeMode.light:
        return lightTheme;
      case AppThemeMode.dark:
        return darkTheme;
      case AppThemeMode.system:
        final Brightness systemBrightness =
            PlatformDispatcher.instance.platformBrightness;
        if (systemBrightness == Brightness.dark) {
          return darkTheme;
        } else if (systemBrightness == Brightness.light) {
          return lightTheme;
        }
        return lightTheme;
    }
  }

  String getTitle(BuildContext context) {
    switch (this) {
      case AppThemeMode.light:
        return S.of(context).theme_light;
      case AppThemeMode.dark:
        return S.of(context).theme_dark;
      case AppThemeMode.system:
        return S.of(context).theme_system;
    }
  }

  String get code {
    switch (this) {
      case AppThemeMode.light:
        return 'light';
      case AppThemeMode.dark:
        return 'dark';
      case AppThemeMode.system:
        return 'system';
    }
  }

  static AppThemeMode fromCode(String code) {
    switch (code) {
      case 'light':
        return AppThemeMode.light;
      case 'dark':
        return AppThemeMode.dark;
      case 'system':
        return AppThemeMode.system;
      default:
        throw ArgumentError('Invalid theme mode: $code');
    }
  }
}

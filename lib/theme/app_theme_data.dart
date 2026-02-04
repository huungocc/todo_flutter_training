import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/theme/app_color_theme.dart';
import 'package:todo_flutter_training/theme/app_theme_interface.dart';

@lazySingleton
class LightThemeData extends AppThemeData {
  final _colorData = LightColorData();

  @override
  AppColorData get colors => _colorData;

  @override
  ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.surface,
      colorScheme: ColorScheme.light(
        primary: colors.primary,
        secondary: colors.secondary,
        surface: colors.surface,
        error: colors.error,
        onPrimary: colors.onPrimary,
        onSecondary: colors.onSecondary,
        onSurface: colors.onSurface,
        onError: colors.onError,
      ),
      extensions: [
        AppColorTheme(colors: colors),
      ],
    );
  }
}

@lazySingleton
class DarkThemeData extends AppThemeData {
  final _colorData = DarkColorData();

  @override
  AppColorData get colors => _colorData;

  @override
  ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.surface,
      colorScheme: ColorScheme.dark(
        primary: colors.primary,
        secondary: colors.secondary,
        surface: colors.surface,
        error: colors.error,
        onPrimary: colors.onPrimary,
        onSecondary: colors.onSecondary,
        onSurface: colors.onSurface,
        onError: colors.onError,
      ),
      extensions: [
        AppColorTheme(colors: colors),
      ],
    );
  }
}

class LightColorData extends AppColorData {
  @override
  Color get primary => AppColors.primary;

  @override
  Color get secondary => AppColors.accent;

  @override
  Color get surface => AppColors.lightBackground;

  @override
  Color get onPrimary => AppColors.lightSurface;

  @override
  Color get onSecondary => const Color(0xFF3A2B00);

  @override
  Color get onSurface => AppColors.textPrimary;

  @override
  Color get error => AppColors.error;

  @override
  Color get onError => Colors.white;
}

class DarkColorData extends AppColorData {
  @override
  Color get primary => AppColors.primaryLight;

  @override
  Color get secondary => AppColors.accent;

  @override
  Color get surface => AppColors.darkBackground;

  @override
  Color get onPrimary => AppColors.darkSurface;

  @override
  Color get onSecondary => const Color(0xFF2E2200);

  @override
  Color get onSurface => AppColors.textOnDark;

  @override
  Color get error => const Color(0xFFEF5350);

  @override
  Color get onError => Colors.black;
}

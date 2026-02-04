import 'package:flutter/material.dart';
import 'package:todo_flutter_training/theme/app_color_theme.dart';
import 'package:todo_flutter_training/theme/app_theme_interface.dart';

extension AppThemeContextExtension on BuildContext {
  AppColorData get colors =>
      Theme.of(this).extension<AppColorTheme>()!.colors;
}

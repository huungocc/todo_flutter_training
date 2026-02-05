import 'package:flutter/material.dart';
import 'package:todo_flutter_training/theme/app_theme_interface.dart';

@immutable
class AppColorTheme extends ThemeExtension<AppColorTheme> {
  final AppColorData colors;

  const AppColorTheme({required this.colors});

  @override
  AppColorTheme copyWith({AppColorData? colors}) {
    return AppColorTheme(colors: colors ?? this.colors);
  }

  @override
  AppColorTheme lerp(ThemeExtension<AppColorTheme>? other, double t) {
    return this;
  }
}

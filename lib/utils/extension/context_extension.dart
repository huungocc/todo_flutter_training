import 'package:flutter/material.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/text_style/app_text_style_context.dart';
import 'package:todo_flutter_training/theme/app_color_theme.dart';
import 'package:todo_flutter_training/theme/app_theme_interface.dart';

extension LocalizationExtension on BuildContext {
  S get l10n => S.of(this);
}

extension AppThemeContextExtension on BuildContext {
  AppColorData get colors =>
      Theme.of(this).extension<AppColorTheme>()!.colors;
}

extension AppTextStyleExtension on BuildContext {
  AppTextStyleContext get appTextStyle => AppTextStyleContext(this);
}

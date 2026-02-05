import 'package:flutter/material.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';

class AppTheme {
  static Theme pickerTheme(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: context.colors.primary,
          onPrimary: context.colors.onPrimary,
          surface: context.colors.surface,
          onSurface: context.colors.onSurface,
        ),
      ),
      child: child!,
    );
  }
}

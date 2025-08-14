import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';

class AppTheme {
  static Theme pickerTheme(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.light(
          primary: AppColors.todoPurple,
          onPrimary: AppColors.textWhite,
          onSurface: AppColors.textBlack,
          surface: Colors.white,
        ),
      ),
      child: child!,
    );
  }
}

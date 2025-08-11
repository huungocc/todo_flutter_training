import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyle {
  AppTextStyle._();

  ///Black
  static const black = TextStyle(
    color: AppColors.textBlack,
    fontWeight: FontWeight.w400,
  );

  //s16
  static final blackS16 = black.copyWith(fontSize: 16);
  static final blackS16Bold = blackS16.copyWith(fontWeight: FontWeight.bold);
  static final blackS16W400 = blackS16.copyWith(fontWeight: FontWeight.w400);
  static final blackS16W500 = blackS16.copyWith(fontWeight: FontWeight.w500);
  static final blackS16W600 = blackS16.copyWith(fontWeight: FontWeight.w600);

  //s18
  static final blackS18 = black.copyWith(fontSize: 18);
  static final blackS18Bold = blackS18.copyWith(fontWeight: FontWeight.bold);
  static final blackS18W400 = blackS18.copyWith(fontWeight: FontWeight.w600);
  static final blackS18W500 = blackS18.copyWith(fontWeight: FontWeight.w800);

  //s24
  static final blackS24 = black.copyWith(fontSize: 24);
  static final blackS24Bold = blackS18.copyWith(fontWeight: FontWeight.bold);
  static final blackS24W400 = blackS18.copyWith(fontWeight: FontWeight.w400);
  static final blackS24W500 = blackS18.copyWith(fontWeight: FontWeight.w500);

  ///White
  static const white = TextStyle(
    color: AppColors.textWhite,
    fontWeight: FontWeight.w400,
  );

  //s16
  static final whiteS16 = white.copyWith(fontSize: 16);
  static final whiteS16Bold = whiteS16.copyWith(fontWeight: FontWeight.bold);
  static final whiteS16W400 = whiteS16.copyWith(fontWeight: FontWeight.w400);
  static final whiteS16W500 = whiteS16.copyWith(fontWeight: FontWeight.w500);
  static final whiteS16W600 = whiteS16.copyWith(fontWeight: FontWeight.w600);

  //s18
  static final whiteS18 = white.copyWith(fontSize: 18);
  static final whiteS18Bold = whiteS18.copyWith(fontWeight: FontWeight.bold);
  static final whiteS18W400 = whiteS18.copyWith(fontWeight: FontWeight.w600);
  static final whiteS18W500 = whiteS18.copyWith(fontWeight: FontWeight.w800);

  //s24
  static final whiteS24 = white.copyWith(fontSize: 24);
  static final whiteS24Bold = whiteS18.copyWith(fontWeight: FontWeight.bold);
  static final whiteS24W400 = whiteS18.copyWith(fontWeight: FontWeight.w400);
  static final whiteS24W500 = whiteS18.copyWith(fontWeight: FontWeight.w500);

  //s24
  static final whiteS32 = white.copyWith(fontSize: 32);
  static final whiteS32Bold = whiteS32.copyWith(fontWeight: FontWeight.bold);
  static final whiteS32W400 = whiteS32.copyWith(fontWeight: FontWeight.w400);
  static final whiteS32W500 = whiteS32.copyWith(fontWeight: FontWeight.w500);
}

extension AppTextStyleExtension on AppTextStyle {
  static TextStyle taskTitle({
    required bool isExpired,
    required bool isCompleted,
  }) {
    var style = AppTextStyle.blackS16W600.copyWith(
      color: isExpired ? AppColors.error : AppColors.textBlack,
      decoration: isCompleted ? TextDecoration.lineThrough : null,
    );
    return style;
  }

  static TextStyle taskTime({
    required bool isExpired,
    required bool isCompleted,
  }) {
    var style = AppTextStyle.blackS16W500.copyWith(
      color: isExpired ? AppColors.subError : AppColors.buttonBGDisabled,
      decoration: isCompleted ? TextDecoration.lineThrough : null,
    );
    return style;
  }
}

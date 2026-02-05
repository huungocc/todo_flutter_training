import 'package:flutter/material.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';

class AppTextStyle {
  AppTextStyle._();

  // Font Family
  static const String fontFamily = "Inter";

  // Text Color
  static TextStyle primary(BuildContext context) {
    return TextStyle(
      color: context.colors.primary,
      fontSize: 16,
      fontFamily: fontFamily
    );
  }

  static TextStyle secondary(BuildContext context) {
    return TextStyle(
        color: context.colors.secondary,
        fontSize: 16,
        fontFamily: fontFamily
    );
  }

  static TextStyle surface(BuildContext context) {
    return TextStyle(
        color: context.colors.surface,
        fontSize: 16,
        fontFamily: fontFamily
    );
  }

  static TextStyle error(BuildContext context) {
    return TextStyle(
        color: context.colors.error,
        fontSize: 16,
        fontFamily: fontFamily
    );
  }

  static TextStyle onPrimary(BuildContext context) {
    return TextStyle(
        color: context.colors.onPrimary,
        fontSize: 16,
        fontFamily: fontFamily
    );
  }

  static TextStyle onSecondary(BuildContext context) {
    return TextStyle(
        color: context.colors.onSecondary,
        fontSize: 16,
        fontFamily: fontFamily
    );
  }

  static TextStyle onSurface(BuildContext context) {
    return TextStyle(
        color: context.colors.onSurface,
        fontSize: 16,
        fontFamily: fontFamily
    );
  }

  static TextStyle onError(BuildContext context) {
    return TextStyle(
        color: context.colors.onError,
        fontSize: 16,
        fontFamily: fontFamily
    );
  }
}

extension AppTextStyleExt on TextStyle {
  // Size
  TextStyle get s10 => copyWith(fontSize: 10);

  TextStyle get s12 => copyWith(fontSize: 12);

  TextStyle get s14 => copyWith(fontSize: 14);

  TextStyle get s16 => copyWith(fontSize: 16);

  TextStyle get s18 => copyWith(fontSize: 18);

  TextStyle get s20 => copyWith(fontSize: 20);

  TextStyle get s24 => copyWith(fontSize: 24);

  TextStyle get s28 => copyWith(fontSize: 28);

  TextStyle get s30 => copyWith(fontSize: 30);

  TextStyle get s32 => copyWith(fontSize: 32);

  // Weight
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);

  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);

  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);

  // Common
  static TextStyle taskTitle(
      BuildContext context, {
        required bool isExpired,
        required bool isCompleted,
      }) {
    return AppTextStyle.onSurface(context)
        .s16
        .w500
        .copyWith(
      color: isExpired
          ? context.colors.error
          : context.colors.onSurface,
      decoration:
      isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
    );
  }

  static TextStyle taskTime(
      BuildContext context, {
        required bool isExpired,
        required bool isCompleted,
      }) {
    return AppTextStyle.secondary(context)
        .s14
        .w500
        .copyWith(
      color: isExpired
          ? context.colors.error
          : context.colors.onSurface.withValues(alpha: 0.6),
      decoration:
      isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
    );
  }
}

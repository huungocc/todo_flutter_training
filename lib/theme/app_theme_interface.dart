import 'package:flutter/material.dart';

abstract class AppThemeData {
  AppColorData get colors;

  ThemeData get themeData;
}

abstract class AppColorData {
  // Primary
  Color get primary;

  Color get onPrimary;

  // Secondary
  Color get secondary;

  Color get onSecondary;

  // Error
  Color get error;

  Color get onError;

  // Surface
  Color get surface;

  Color get onSurface;
}

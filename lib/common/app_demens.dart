import 'package:flutter/material.dart';

class AppDimens {
  static const double fontSmaller = 11.0;
  static const double fontMaxSmall = 10.0;
  static const double fontSmall = 12.0;
  static const double fontNormal = 14.0;
  static const double fontLarge = 16.0;
  static const double fontExtra = 18.0;

  static const double buttonHeight = 55;
  static const double buttonCornerRadius = 50;
  static const double buttonBorderWidth = 1;

  static const double appBarNormal = 50;
  static const double appBarLarge = 90;
  static const double appBarExtra = 250;

  static const double paddingLarge = 20;
  static const double paddingNormal = 16;
  static const double paddingSmall = 8;

  static const double marginNormal = 16;
  static const double marginLarge = 32;
  static const double marginSmall = 10;

  static const double cardCornerRadius = 20;

  static const double iconSizeSmall = 15;
  static const double iconSizeNormal = 30;
  static const double iconSizeLarge = 50;
  static const double iconBorderRadius = 100;

  static const double textInputCornerRadius = 16;

  static const double avatarSize = 120;
}

class ScreenSize {
  static final ScreenSize _instance = ScreenSize._internal();

  late double width;
  late double height;

  factory ScreenSize.instance() {
    return _instance;
  }

  ScreenSize._internal();

  void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}

import 'package:flutter/material.dart';

import 'app_text_style.dart';

class AppTextStyleContext {
  final BuildContext context;

  AppTextStyleContext(this.context);

  TextStyle get primary => AppTextStyle.primary(context);

  TextStyle get secondary => AppTextStyle.secondary(context);

  TextStyle get surface => AppTextStyle.surface(context);

  TextStyle get error => AppTextStyle.error(context);

  TextStyle get onPrimary => AppTextStyle.onPrimary(context);

  TextStyle get onSecondary => AppTextStyle.onSecondary(context);

  TextStyle get onSurface => AppTextStyle.onSurface(context);

  TextStyle get onError => AppTextStyle.onError(context);
}

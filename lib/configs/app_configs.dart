import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_flutter_training/models/enums/language.dart';

class AppConfigs {
  static const String appName = "Movie";

  ///Local
  static const defaultLanguage = Language.english;
}

class SupabaseAPIConfig {
  static final supabaseUrl = dotenv.env['SUPABASE_URL'].toString();
  static final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'].toString();
}

class NavigationConfig {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  static BuildContext? get context => navigatorKey.currentContext;
}

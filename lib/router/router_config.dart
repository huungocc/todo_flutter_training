import 'package:go_router/go_router.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/ui/pages/auth/auth_page.dart';
import 'package:todo_flutter_training/ui/pages/app_start/splash/splash_page.dart';
import 'package:todo_flutter_training/ui/pages/change_password/change_password_page.dart';
import 'package:todo_flutter_training/ui/pages/setting/setting_page.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/list_todo_page.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    routes: _routes,
    debugLogDiagnostics: true,
    navigatorKey: NavigationConfig.navigatorKey,
  );

  ///main page
  static const String splash = "/";
  static const String listTodo = "/listTodo";
  static const String auth = "/auth";
  static const String setting = "/setting";
  static const String changePassword = "/changePassword";

  static final _routes = <RouteBase>[
    GoRoute(path: splash, builder: (context, state) => const SplashPage()),
    GoRoute(
      name: listTodo,
      path: listTodo,
      builder: (context, state) => const ListTodoPage(),
    ),
    GoRoute(
      name: auth,
      path: auth,
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      name: setting,
      path: setting,
      builder: (context, state) => const SettingPage(),
    ),
    GoRoute(
      name: changePassword,
      path: changePassword,
      builder: (context, state) => const ChangePasswordPage(),
    ),
  ];
}

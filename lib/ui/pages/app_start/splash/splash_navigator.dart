import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/common/app_navigator.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class SplashNavigator extends AppNavigator {
  SplashNavigator({required super.context});

  Future<void> checkAuthStatus() async {
    final user = Supabase.instance.client.auth.currentUser;

    if (user != null) {
      navigateAndPopUntil(AppRouter.listTodo);
    } else {
      navigateAndPopUntil(AppRouter.auth);
    }
  }
}

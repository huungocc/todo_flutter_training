import 'package:todo_flutter_training/common/app_navigator.dart';
import 'package:todo_flutter_training/database/share_preferences_helper.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class SplashNavigator extends AppNavigator {
  SplashNavigator({required super.context});

  Future<void> checkAuthStatus() async {
    final accessToken = await SharedPreferencesHelper.getAccessToken();
    if (accessToken != null) {
      navigateSplash(AppRouter.listTodo);
    } else {
      navigateSplash(AppRouter.auth);
    }
  }
}

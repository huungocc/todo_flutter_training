import 'package:todo_flutter_training/common/app_navigator.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class SplashNavigator extends AppNavigator {
  SplashNavigator({required super.context});

  void checkAuthStatus() {
    // Todo: Check Auth Status
    navigateSplash(AppRouter.auth);
  }
}

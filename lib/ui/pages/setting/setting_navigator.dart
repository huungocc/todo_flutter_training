import 'package:todo_flutter_training/common/app_navigator.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class SettingNavigator extends AppNavigator {
  SettingNavigator({ required super.context });

  void navigateToLogin() {
    navigateAndPopUntil(AppRouter.auth);
  }
}
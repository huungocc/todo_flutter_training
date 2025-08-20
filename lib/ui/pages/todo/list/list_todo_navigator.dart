import 'package:todo_flutter_training/common/app_navigator.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class ListTodoNavigator extends AppNavigator {
  ListTodoNavigator({required super.context});

  void navigateToSetting() {
    pushNamed(AppRouter.setting);
  }
}
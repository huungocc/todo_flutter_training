import 'package:todo_flutter_training/common/app_navigator.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class AuthNavigator extends AppNavigator {
  AuthNavigator({required super.context});

  void navigateToListTodo() {
    navigateAndPopUntil(AppRouter.listTodo);
  }
}
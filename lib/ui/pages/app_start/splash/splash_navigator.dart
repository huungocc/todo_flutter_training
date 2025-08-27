import 'package:todo_flutter_training/common/app_navigator.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class SplashNavigator extends AppNavigator {
  final AuthRepository authRepository;

  SplashNavigator({required super.context, required this.authRepository});

  Future<void> checkAuthStatus() async {
    final user = authRepository.getCurrentUser();

    if (user != null) {
      navigateAndPopUntil(AppRouter.listTodo);
    } else {
      navigateAndPopUntil(AppRouter.auth);
    }
  }
}

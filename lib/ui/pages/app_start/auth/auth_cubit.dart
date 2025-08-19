import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit({required this.authRepository}) : super(const AuthState());

  void changeAuthType(AuthType authType) {
    switch (authType) {
      case AuthType.login:
        emit(state.copyWith(authType: AuthType.login));
        break;
      case AuthType.register:
        emit(state.copyWith(authType: AuthType.register));
        break;
    }
  }
}
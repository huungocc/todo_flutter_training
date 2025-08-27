import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/ui/pages/auth/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState());

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

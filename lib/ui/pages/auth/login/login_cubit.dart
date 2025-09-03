import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/auth/login/login_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/utils/validator_util.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState());

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  Future<void> close() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    return super.close();
  }

  Future<void> login() async {
    if (!ValidatorUtil.validateLoginInput(
      email: loginEmailController.text,
      password: loginPasswordController.text,
    )) {
      throw Exception('');
    }

    emit(state.copyWith(loginLoadStatus: LoadStatus.loading));

    try {
      final user = await _authRepository.signIn(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );

      if (user != null) {
        emit(state.copyWith(
          loginLoadStatus: LoadStatus.success,
          isConfirmed: true,
        ));
        ExceptionHandler.showSuccessSnackBar(S.current.login_success);
      } else {
        emit(state.copyWith(
          loginLoadStatus: LoadStatus.success,
          isConfirmed: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(loginLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }
}

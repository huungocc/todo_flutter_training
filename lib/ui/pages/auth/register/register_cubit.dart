import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/auth/register/register_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/utils/validator_util.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository authRepository;

  RegisterCubit({required this.authRepository}) : super(const RegisterState());

  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerConfirmPasswordController =
      TextEditingController();

  @override
  Future<void> close() {
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();
    return super.close();
  }

  Future<void> register() async {
    try {
      if (!ValidatorUtil.validateRegisterInput(
        email: registerEmailController.text,
        password: registerPasswordController.text,
        confirmPassword: registerConfirmPasswordController.text,
      )) {
        throw Exception('');
      }

      emit(state.copyWith(registerLoadStatus: LoadStatus.loading));

      await authRepository.signUp(
        email: registerEmailController.text,
        password: registerPasswordController.text,
      );

      emit(state.copyWith(registerLoadStatus: LoadStatus.success));

      ExceptionHandler.showSuccessSnackBar(S.current.register_success);
    } catch (e) {
      emit(state.copyWith(registerLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }
}

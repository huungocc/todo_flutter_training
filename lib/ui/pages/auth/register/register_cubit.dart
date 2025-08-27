import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sab;
import 'package:todo_flutter_training/common/app_validator.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/auth/login/login_state.dart';
import 'package:todo_flutter_training/ui/pages/auth/register/register_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

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

  // ------------------ Validation ------------------
  bool _validateRegisterInput() {
    final email = registerEmailController.text.trim();
    final password = registerPasswordController.text;
    final confirmPassword = registerConfirmPasswordController.text;

    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      ExceptionHandler.showErrorSnackBar(S.current.please_fill_in_all_fields);
      return false;
    }

    final isEmailValid = AppValidator.validateEmail(email);
    if (!isEmailValid) {
      ExceptionHandler.showErrorSnackBar(S.current.invalid_email);
      return false;
    }

    final isPasswordValid = AppValidator.validatePassword(password);
    if (!isPasswordValid) {
      ExceptionHandler.showErrorSnackBar(S.current.invalid_password);
      return false;
    }

    final isConfirmPasswordValid = AppValidator.validateConfirmPassword(
      password,
      confirmPassword,
    );
    if (!isConfirmPasswordValid) {
      ExceptionHandler.showErrorSnackBar(S.current.invalid_confirm_password);
      return false;
    }

    return true;
  }

  // ------------------ Auth Actions ------------------
  Future<void> register() async {
    try {
      if (!_validateRegisterInput()) return;

      emit(state.copyWith(registerLoadStatus: LoadStatus.loading));

      await authRepository.signUp(
        email: registerEmailController.text,
        password: registerPasswordController.text,
      );

      emit(
        state.copyWith(
          registerLoadStatus: LoadStatus.success,
        ),
      );

      ExceptionHandler.showSuccessSnackBar(S.current.register_success);
    } catch (e) {
      emit(state.copyWith(registerLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }
}

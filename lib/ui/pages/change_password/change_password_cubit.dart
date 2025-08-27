import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_validator.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/change_password/change_password_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final AuthRepository authRepository;

  ChangePasswordCubit({required this.authRepository})
    : super(const ChangePasswordState());

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    return super.close();
  }

  // ------------------ Validation ------------------
  bool _validateChangePasswordInput() {
    final oldPassword = currentPasswordController.text.trim();
    final newPassword = newPasswordController.text;
    final confirmNewPassword = confirmNewPasswordController.text;

    if (oldPassword.isEmpty ||
        newPassword.isEmpty ||
        confirmNewPassword.isEmpty) {
      ExceptionHandler.showErrorSnackBar(S.current.please_fill_in_all_fields);
      return false;
    }

    final isOldPasswordValid = AppValidator.validatePassword(oldPassword);
    if (!isOldPasswordValid) {
      ExceptionHandler.showErrorSnackBar(S.current.invalid_password);
      return false;
    }

    final isNewPasswordValid = AppValidator.validatePassword(newPassword);
    if (!isNewPasswordValid) {
      ExceptionHandler.showErrorSnackBar(S.current.invalid_password);
      return false;
    }

    final isConfirmNewPasswordValid = AppValidator.validateConfirmPassword(
      newPassword,
      confirmNewPassword,
    );
    if (!isConfirmNewPasswordValid) {
      ExceptionHandler.showErrorSnackBar(S.current.invalid_confirm_password);
      return false;
    }

    return true;
  }

  // ------------------ Actions ------------------
  Future<void> changePassword() async {
    try {
      if (!_validateChangePasswordInput()) return;

      emit(state.copyWith(changePasswordLoadStatus: LoadStatus.loading));

      final oldPassword = currentPasswordController.text;
      final newPassword = newPasswordController.text;

      await authRepository.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      emit(state.copyWith(changePasswordLoadStatus: LoadStatus.success));

      ExceptionHandler.showSuccessSnackBar(S.current.change_password_success);
    } catch (e) {
      emit(state.copyWith(changePasswordLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/change_password/change_password_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/utils/validator_util.dart';

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

  Future<void> changePassword() async {
    try {
      emit(state.copyWith(changePasswordLoadStatus: LoadStatus.loading));

      if (!ValidatorUtil.validateChangePasswordInput(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
        confirmNewPassword: confirmNewPasswordController.text,
      )) {
        throw Exception('check');
      }

      await authRepository.changePassword(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );

      emit(state.copyWith(changePasswordLoadStatus: LoadStatus.success));

      ExceptionHandler.showSuccessSnackBar(S.current.change_password_success);
    } catch (e) {
      emit(state.copyWith(changePasswordLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }
}

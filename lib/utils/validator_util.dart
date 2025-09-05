import 'package:todo_flutter_training/common/app_validator.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

class ValidatorUtil {
  static bool validateLoginInput({
    required String email,
    required String password,
  }) {
    if (email.isEmpty || password.isEmpty) {
      ExceptionHandler.showErrorSnackBar(S.current.please_fill_in_all_fields);
      return false;
    }
    if (!AppValidator.validateEmail(email)) {
      ExceptionHandler.showErrorSnackBar(S.current.invalid_email);
      return false;
    }
    if (!AppValidator.validatePassword(password)) {
      ExceptionHandler.showErrorSnackBar(S.current.invalid_password);
      return false;
    }
    return true;
  }

  static bool validateRegisterInput({
    required String email,
    required String password,
    required String confirmPassword,
  }) {
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

  static bool validateChangePasswordInput({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) {
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
}
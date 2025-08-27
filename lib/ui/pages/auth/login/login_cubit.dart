import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/common/app_validator.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/auth/login/login_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  StreamSubscription? _linkSubscription;
  StreamSubscription? _authStateSubscription;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const LoginState()) {
    _listenAuthState();
    _listenDeepLink();
  }

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();

  @override
  Future<void> close() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    _linkSubscription?.cancel();
    _authStateSubscription?.cancel();
    return super.close();
  }

  Future<void> login() async {
    if (!_validateLoginInput()) return;

    emit(state.copyWith(loginLoadStatus: LoadStatus.loading));

    try {
      final user = await _authRepository.signIn(
        email: loginEmailController.text.trim(),
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

  void _listenDeepLink() {
    _linkSubscription = AppLinks().uriLinkStream.listen((uri) async {
      await _authRepository.handleDeepLink(uri);
    });
  }

  void _listenAuthState() {
    _authStateSubscription = _authRepository.authStatusStream().listen((status) {
      if (status.isSignedIn) {
        emit(state.copyWith(
          loginLoadStatus: LoadStatus.success,
          isConfirmed: true,
        ));
        ExceptionHandler.showSuccessSnackBar(
          S.current.email_verification_successful,
        );
      }
    });
  }

  bool _validateLoginInput() {
    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text;

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
}

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
import 'package:todo_flutter_training/ui/pages/app_start/auth/auth_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  StreamSubscription? _linkSubscription;
  StreamSubscription? _authStateSubscription;

  AuthCubit({required this.authRepository}) : super(const AuthState()) {
    _listenAuthState();
    _listenDeepLink();
  }

  final TextEditingController loginEmailController = TextEditingController();
  final TextEditingController loginPasswordController = TextEditingController();

  final TextEditingController registerEmailController = TextEditingController();
  final TextEditingController registerPasswordController =
      TextEditingController();
  final TextEditingController registerConfirmPasswordController =
      TextEditingController();

  @override
  Future<void> close() {
    loginEmailController.dispose();
    loginPasswordController.dispose();
    registerEmailController.dispose();
    registerPasswordController.dispose();
    registerConfirmPasswordController.dispose();

    _linkSubscription?.cancel();
    _authStateSubscription?.cancel();
    return super.close();
  }

  // ------------------ Validation ------------------
  bool _validateLoginInput() {
    final email = loginEmailController.text.trim();
    final password = loginPasswordController.text;

    if (email.isEmpty || password.isEmpty) {
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

    return true;
  }

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

  // ------------------ Deep link ------------------
  void _listenDeepLink() {
    _linkSubscription = AppLinks().uriLinkStream.listen((Uri? uri) async {
      if (uri != null) {
        await sab.Supabase.instance.client.auth.getSessionFromUrl(uri);
      }
    });
  }

  // ------------------ Auth State ------------------
  void _listenAuthState() {
    _authStateSubscription = sab.Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      if (data.event == sab.AuthChangeEvent.signedIn) {
        emit(state.copyWith(
          loginLoadStatus: LoadStatus.success,
          registerLoadStatus: LoadStatus.success,
          isConfirmed: true,
        ));
        ExceptionHandler.showSuccessSnackBar(S.current.email_verification_successful);
      }
    });
  }

  // ------------------ Auth Actions ------------------
  Future<void> login() async {
    try {
      if (!_validateLoginInput()) return;

      emit(state.copyWith(loginLoadStatus: LoadStatus.loading));

      await authRepository.signIn(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );

      final session = sab.Supabase.instance.client.auth.currentSession;
      final isConfirmed = session != null;

      emit(
        state.copyWith(
          loginLoadStatus: LoadStatus.success,
          isConfirmed: isConfirmed,
        ),
      );

      ExceptionHandler.showSuccessSnackBar(S.current.login_success);
    } catch (e) {
      emit(state.copyWith(loginLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> register() async {
    try {
      if (!_validateRegisterInput()) return;

      emit(state.copyWith(registerLoadStatus: LoadStatus.loading));

      await authRepository.signUp(
        email: registerEmailController.text,
        password: registerPasswordController.text,
      );

      final session = sab.Supabase.instance.client.auth.currentSession;
      final isConfirmed = session != null;

      emit(
        state.copyWith(
          registerLoadStatus: LoadStatus.success,
          isConfirmed: isConfirmed,
        ),
      );

      ExceptionHandler.showSuccessSnackBar(S.current.register_success);
    } catch (e) {
      emit(state.copyWith(registerLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> logout() async {
    try {
      emit(state.copyWith(logoutLoadStatus: LoadStatus.loading));

      await authRepository.signOut();

      emit(state.copyWith(logoutLoadStatus: LoadStatus.success));

      ExceptionHandler.showSuccessSnackBar(S.current.logout_success);
    } catch (e) {
      emit(state.copyWith(logoutLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }
}

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/setting/setting_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  final AuthRepository authRepository;

  SettingCubit({required this.authRepository}) : super(const SettingState());

  // ------------------ Auth Actions ------------------
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

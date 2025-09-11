import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/database/share_preferences_helper.dart';
import 'package:todo_flutter_training/global_blocs/user_info/user_info_state.dart';
import 'package:todo_flutter_training/models/entities/user_info/user_info_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

@injectable
class UserInfoCubit extends Cubit<UserInfoState> {
  final AuthRepository authRepository;

  UserInfoCubit({required this.authRepository}) : super(const UserInfoState());

  Future<void> loadUserInfo() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final localUser = await _getUserInfoFromLocal();
      if (localUser != null) {
        emit(
          state.copyWith(loadStatus: LoadStatus.success, userInfo: localUser),
        );
        return;
      }

      final remoteUser = await _getUserInfoFromNetwork();
      if (remoteUser != null) {
        emit(
          state.copyWith(loadStatus: LoadStatus.success, userInfo: remoteUser),
        );
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<UserInfoEntity?> _getUserInfoFromLocal() async {
    return await SharedPreferencesHelper.getUserInfo();
  }

  Future<UserInfoEntity?> _getUserInfoFromNetwork() async {
    final userInfo = await authRepository.getUserInfo();
    if (userInfo != null) {
      await SharedPreferencesHelper.saveUserInfo(userInfo);
    }
    return userInfo;
  }

  // Bỏ qua local, load từ network
  Future<void> refreshUserInfo() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final remoteUser = await _getUserInfoFromNetwork();
      if (remoteUser != null) {
        emit(
          state.copyWith(loadStatus: LoadStatus.success, userInfo: remoteUser),
        );
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> deleteUserInfo() async {
    await SharedPreferencesHelper.clearUserInfo();
    emit(
      state.copyWith(
        loadStatus: LoadStatus.success,
        userInfo: UserInfoEntity(),
      ),
    );
  }
}

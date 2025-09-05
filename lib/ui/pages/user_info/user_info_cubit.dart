import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/models/entities/user_info/user_info_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/user_info/user_info_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

@injectable
class UserInfoCubit extends Cubit<UserInfoState> {
  final AuthRepository authRepository;

  UserInfoCubit({required this.authRepository}) : super(const UserInfoState());

  final TextEditingController userNameController = TextEditingController();

  @override
  Future<void> close() {
    userNameController.dispose();
    return super.close();
  }

  void setEditing() {
    emit(state.copyWith(isEditing: !state.isEditing));
  }

  void _setTextFieldUserInfo(UserInfoEntity entity) {
    userNameController.text = entity.userName ?? '';
  }

  void pickAvatarFromFile(XFile avatarFile) {
    emit(state.copyWith(avatarFile: avatarFile));
  }

  Future<void> loadUserInfo() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));
    try {
      final userInfo = await authRepository.getUserInfo();

      if (userInfo != null) {
        _setTextFieldUserInfo(userInfo);
        emit(
          state.copyWith(loadStatus: LoadStatus.success, userInfo: userInfo),
        );
      } else {
        emit(state.copyWith(loadStatus: LoadStatus.failure));
      }
    } catch (e) {
      emit(state.copyWith(loadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> uploadAvatar() async {
    if (state.avatarFile == null) {
      ExceptionHandler.showErrorSnackBar("No avatar selected");
      return;
    }

    try {
      emit(state.copyWith(uploadStatus: LoadStatus.loading));

      final avatarUrl = await authRepository.uploadUserAvatar(state.avatarFile!);

      if (avatarUrl == null || avatarUrl.isEmpty) {
        throw Exception("Upload avatar failed");
      }

      emit(
        state.copyWith(
          uploadStatus: LoadStatus.success,
          userInfo: state.userInfo.copyWith(avatarUrl: avatarUrl),
        ),
      );
    } catch (e) {
      emit(state.copyWith(uploadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar("$e");
    }
  }

  void _updateEntityData() {
    final updatedUserInfo = state.userInfo.copyWith(
      userName: userNameController.text,
    );
    emit(state.copyWith(userInfo: updatedUserInfo));
  }

  bool _validateUserInfo() {
    if (userNameController.text.isEmpty) {
      ExceptionHandler.showErrorSnackBar("User name cannot be empty");
      return false;
    }
    return true;
  }

  Future<void> updateUserInfo() async {
    try {
      if (!_validateUserInfo()) return;

      _updateEntityData();

      emit(state.copyWith(updateStatus: LoadStatus.loading));

      await authRepository.updateUserInfo(state.userInfo);

      emit(state.copyWith(updateStatus: LoadStatus.success));

      ExceptionHandler.showSuccessSnackBar("User info updated successfully");
    } catch (e) {
      emit(state.copyWith(updateStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar("$e");
    }
  }

}

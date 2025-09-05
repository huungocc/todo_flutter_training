import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/repository/auth_repository.dart';
import 'package:todo_flutter_training/ui/pages/change_user_info/change_user_info_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

@injectable
class ChangeUserInfoCubit extends Cubit<ChangeUserInfoState> {
  final AuthRepository authRepository;

  ChangeUserInfoCubit({required this.authRepository})
    : super(const ChangeUserInfoState());

  final TextEditingController userNameController = TextEditingController();

  @override
  Future<void> close() {
    userNameController.dispose();
    return super.close();
  }

  void setEditing() {
    emit(state.copyWith(isEditing: !state.isEditing));
  }

  void pickAvatarFromFile(XFile avatarFile) {
    emit(state.copyWith(avatarFile: avatarFile));
  }

  Future<void> uploadAvatar() async {
    if (state.avatarFile == null) {
      ExceptionHandler.showErrorSnackBar("No avatar selected");
      return;
    }

    try {
      emit(state.copyWith(uploadStatus: LoadStatus.loading));

      final avatarUrl = await authRepository.uploadUserAvatar(
        state.avatarFile!,
      );

      if (avatarUrl == null || avatarUrl.isEmpty) {
        throw Exception("Upload avatar failed");
      }

      emit(
        state.copyWith(
          uploadStatus: LoadStatus.success,
          editedUserInfo: state.editedUserInfo.copyWith(avatarUrl: avatarUrl),
        ),
      );
    } catch (e) {
      emit(state.copyWith(uploadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar("$e");
    }
  }

  void _updateEntityData() {
    final updatedUserInfo = state.editedUserInfo.copyWith(
      userName: userNameController.text,
    );
    emit(state.copyWith(editedUserInfo: updatedUserInfo));
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

      await authRepository.updateUserInfo(state.editedUserInfo);

      emit(state.copyWith(updateStatus: LoadStatus.success));

      ExceptionHandler.showSuccessSnackBar("User info updated successfully");
    } catch (e) {
      emit(state.copyWith(updateStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar("$e");
    }
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_flutter_training/models/entities/user_info/user_info_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'user_info_state.freezed.dart';

@freezed
abstract class UserInfoState with _$UserInfoState {
  const factory UserInfoState({
    @Default(UserInfoEntity()) UserInfoEntity userInfo,
    XFile? avatarFile,
    @Default(LoadStatus.initial) LoadStatus loadStatus,
    @Default(LoadStatus.initial) LoadStatus updateStatus,
    @Default(LoadStatus.initial) LoadStatus uploadStatus,
    @Default(false) bool isEditing,
  }) = _UserInfoState;
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/entities/user_info/user_info_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'user_info_state.freezed.dart';

@freezed
abstract class UserInfoState with _$UserInfoState {
  const factory UserInfoState({
    @Default(UserInfoEntity()) UserInfoEntity userInfo,
    @Default(LoadStatus.initial) LoadStatus loadStatus,
  }) = _UserInfoState;
}

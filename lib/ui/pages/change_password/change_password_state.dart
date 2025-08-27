import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'change_password_state.freezed.dart';

@freezed
abstract class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState({
    @Default(LoadStatus.initial) LoadStatus changePasswordLoadStatus,
  }) = _ChangePasswordState;
}
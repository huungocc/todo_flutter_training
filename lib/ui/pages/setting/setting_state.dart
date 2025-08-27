import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'setting_state.freezed.dart';

@freezed
abstract class SettingState with _$SettingState {
  const factory SettingState({
    @Default(LoadStatus.initial) LoadStatus logoutLoadStatus,
    @Default(false) bool isConfirmed,
  }) = _SettingState;
}
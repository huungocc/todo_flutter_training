import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    @Default(LoadStatus.initial) LoadStatus loginLoadStatus,
    @Default(false) bool isConfirmed,
  }) = _LoginState;
}
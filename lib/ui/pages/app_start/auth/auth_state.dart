import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(LoadStatus.initial) LoadStatus loadStatus,
    @Default(AuthType.login) AuthType authType,
  }) = _AuthState;
}
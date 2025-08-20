import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/entities/auth/auth_entity.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(LoadStatus.initial) LoadStatus loginLoadStatus,
    @Default(LoadStatus.initial) LoadStatus registerLoadStatus,
    @Default(AuthType.login) AuthType authType,
    @Default(false) bool isConfirmed,
    AuthEntity? authEntity,
  }) = _AuthState;
}
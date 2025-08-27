import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthType.login) AuthType authType,
  }) = _AuthState;
}
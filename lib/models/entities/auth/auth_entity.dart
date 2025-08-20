import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/entities/session/session_entity.dart';
import 'package:todo_flutter_training/models/entities/user/user_entity.dart';

part 'auth_entity.freezed.dart';
part 'auth_entity.g.dart';

@freezed
abstract class AuthEntity with _$AuthEntity {
  const factory AuthEntity({
    required UserEntity user,
    required SessionEntity session,
  }) = _AuthEntity;

  factory AuthEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthEntityFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_entity.freezed.dart';
part 'auth_user_entity.g.dart';

@freezed
abstract class AuthUserEntity with _$AuthUserEntity {
  const factory AuthUserEntity ({
    @JsonKey(includeIfNull: false) String? id,
    String? email,
    @Default(false) bool isConfirmed,
  }) = _AuthUserEntity;

  factory AuthUserEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthUserEntityFromJson(json);
}

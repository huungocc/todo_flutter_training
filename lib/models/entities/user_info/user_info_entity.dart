import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_entity.freezed.dart';
part 'user_info_entity.g.dart';

@freezed
abstract class UserInfoEntity with _$UserInfoEntity {
  const factory UserInfoEntity({
    @JsonKey(name: 'user_id')
    @JsonKey(includeIfNull: false) String? userId,
    @JsonKey(name: 'user_name')
    String? userName,
    @JsonKey(name: 'avatar_url')
    String? avatarUrl,
  }) = _UserInfoEntity;

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      _$UserInfoEntityFromJson(json);
}

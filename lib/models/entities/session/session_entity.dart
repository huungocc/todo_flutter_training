import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_entity.freezed.dart';
part 'session_entity.g.dart';

@freezed
abstract class SessionEntity with _$SessionEntity {
  const factory SessionEntity({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_in') int? expiresIn,
    @JsonKey(name: 'token_type') String? tokenType,
  }) = _SessionEntity;

  factory SessionEntity.fromJson(Map<String, dynamic> json) =>
      _$SessionEntityFromJson(json);
}

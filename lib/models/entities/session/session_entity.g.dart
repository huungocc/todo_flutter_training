// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionEntity _$SessionEntityFromJson(Map<String, dynamic> json) =>
    _SessionEntity(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
      tokenType: json['token_type'] as String?,
    );

Map<String, dynamic> _$SessionEntityToJson(_SessionEntity instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'token_type': instance.tokenType,
    };

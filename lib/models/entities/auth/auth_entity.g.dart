// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthEntity _$AuthEntityFromJson(Map<String, dynamic> json) => _AuthEntity(
  user: UserEntity.fromJson(json['user'] as Map<String, dynamic>),
  session: SessionEntity.fromJson(json['session'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthEntityToJson(_AuthEntity instance) =>
    <String, dynamic>{'user': instance.user, 'session': instance.session};

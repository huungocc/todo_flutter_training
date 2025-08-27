// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthUserEntity _$AuthUserEntityFromJson(Map<String, dynamic> json) =>
    _AuthUserEntity(
      id: json['id'] as String?,
      email: json['email'] as String?,
      isConfirmed: json['isConfirmed'] as bool? ?? false,
    );

Map<String, dynamic> _$AuthUserEntityToJson(_AuthUserEntity instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'email': instance.email,
      'isConfirmed': instance.isConfirmed,
    };

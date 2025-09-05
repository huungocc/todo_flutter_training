// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfoEntity _$UserInfoEntityFromJson(Map<String, dynamic> json) =>
    _UserInfoEntity(
      userId: json['user_id'] as String?,
      userName: json['user_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
    );

Map<String, dynamic> _$UserInfoEntityToJson(_UserInfoEntity instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
      'avatar_url': instance.avatarUrl,
    };

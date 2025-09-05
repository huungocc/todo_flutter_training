// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_user_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangeUserInfoState {

 UserInfoEntity get editedUserInfo; XFile? get avatarFile; LoadStatus get updateStatus; LoadStatus get uploadStatus; bool get isEditing;
/// Create a copy of ChangeUserInfoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeUserInfoStateCopyWith<ChangeUserInfoState> get copyWith => _$ChangeUserInfoStateCopyWithImpl<ChangeUserInfoState>(this as ChangeUserInfoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeUserInfoState&&(identical(other.editedUserInfo, editedUserInfo) || other.editedUserInfo == editedUserInfo)&&(identical(other.avatarFile, avatarFile) || other.avatarFile == avatarFile)&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus)&&(identical(other.uploadStatus, uploadStatus) || other.uploadStatus == uploadStatus)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,editedUserInfo,avatarFile,updateStatus,uploadStatus,isEditing);

@override
String toString() {
  return 'ChangeUserInfoState(editedUserInfo: $editedUserInfo, avatarFile: $avatarFile, updateStatus: $updateStatus, uploadStatus: $uploadStatus, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class $ChangeUserInfoStateCopyWith<$Res>  {
  factory $ChangeUserInfoStateCopyWith(ChangeUserInfoState value, $Res Function(ChangeUserInfoState) _then) = _$ChangeUserInfoStateCopyWithImpl;
@useResult
$Res call({
 UserInfoEntity editedUserInfo, XFile? avatarFile, LoadStatus updateStatus, LoadStatus uploadStatus, bool isEditing
});


$UserInfoEntityCopyWith<$Res> get editedUserInfo;

}
/// @nodoc
class _$ChangeUserInfoStateCopyWithImpl<$Res>
    implements $ChangeUserInfoStateCopyWith<$Res> {
  _$ChangeUserInfoStateCopyWithImpl(this._self, this._then);

  final ChangeUserInfoState _self;
  final $Res Function(ChangeUserInfoState) _then;

/// Create a copy of ChangeUserInfoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? editedUserInfo = null,Object? avatarFile = freezed,Object? updateStatus = null,Object? uploadStatus = null,Object? isEditing = null,}) {
  return _then(_self.copyWith(
editedUserInfo: null == editedUserInfo ? _self.editedUserInfo : editedUserInfo // ignore: cast_nullable_to_non_nullable
as UserInfoEntity,avatarFile: freezed == avatarFile ? _self.avatarFile : avatarFile // ignore: cast_nullable_to_non_nullable
as XFile?,updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,uploadStatus: null == uploadStatus ? _self.uploadStatus : uploadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChangeUserInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoEntityCopyWith<$Res> get editedUserInfo {
  
  return $UserInfoEntityCopyWith<$Res>(_self.editedUserInfo, (value) {
    return _then(_self.copyWith(editedUserInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChangeUserInfoState].
extension ChangeUserInfoStatePatterns on ChangeUserInfoState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChangeUserInfoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChangeUserInfoState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChangeUserInfoState value)  $default,){
final _that = this;
switch (_that) {
case _ChangeUserInfoState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChangeUserInfoState value)?  $default,){
final _that = this;
switch (_that) {
case _ChangeUserInfoState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserInfoEntity editedUserInfo,  XFile? avatarFile,  LoadStatus updateStatus,  LoadStatus uploadStatus,  bool isEditing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChangeUserInfoState() when $default != null:
return $default(_that.editedUserInfo,_that.avatarFile,_that.updateStatus,_that.uploadStatus,_that.isEditing);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserInfoEntity editedUserInfo,  XFile? avatarFile,  LoadStatus updateStatus,  LoadStatus uploadStatus,  bool isEditing)  $default,) {final _that = this;
switch (_that) {
case _ChangeUserInfoState():
return $default(_that.editedUserInfo,_that.avatarFile,_that.updateStatus,_that.uploadStatus,_that.isEditing);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserInfoEntity editedUserInfo,  XFile? avatarFile,  LoadStatus updateStatus,  LoadStatus uploadStatus,  bool isEditing)?  $default,) {final _that = this;
switch (_that) {
case _ChangeUserInfoState() when $default != null:
return $default(_that.editedUserInfo,_that.avatarFile,_that.updateStatus,_that.uploadStatus,_that.isEditing);case _:
  return null;

}
}

}

/// @nodoc


class _ChangeUserInfoState implements ChangeUserInfoState {
  const _ChangeUserInfoState({this.editedUserInfo = const UserInfoEntity(), this.avatarFile, this.updateStatus = LoadStatus.initial, this.uploadStatus = LoadStatus.initial, this.isEditing = false});
  

@override@JsonKey() final  UserInfoEntity editedUserInfo;
@override final  XFile? avatarFile;
@override@JsonKey() final  LoadStatus updateStatus;
@override@JsonKey() final  LoadStatus uploadStatus;
@override@JsonKey() final  bool isEditing;

/// Create a copy of ChangeUserInfoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChangeUserInfoStateCopyWith<_ChangeUserInfoState> get copyWith => __$ChangeUserInfoStateCopyWithImpl<_ChangeUserInfoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChangeUserInfoState&&(identical(other.editedUserInfo, editedUserInfo) || other.editedUserInfo == editedUserInfo)&&(identical(other.avatarFile, avatarFile) || other.avatarFile == avatarFile)&&(identical(other.updateStatus, updateStatus) || other.updateStatus == updateStatus)&&(identical(other.uploadStatus, uploadStatus) || other.uploadStatus == uploadStatus)&&(identical(other.isEditing, isEditing) || other.isEditing == isEditing));
}


@override
int get hashCode => Object.hash(runtimeType,editedUserInfo,avatarFile,updateStatus,uploadStatus,isEditing);

@override
String toString() {
  return 'ChangeUserInfoState(editedUserInfo: $editedUserInfo, avatarFile: $avatarFile, updateStatus: $updateStatus, uploadStatus: $uploadStatus, isEditing: $isEditing)';
}


}

/// @nodoc
abstract mixin class _$ChangeUserInfoStateCopyWith<$Res> implements $ChangeUserInfoStateCopyWith<$Res> {
  factory _$ChangeUserInfoStateCopyWith(_ChangeUserInfoState value, $Res Function(_ChangeUserInfoState) _then) = __$ChangeUserInfoStateCopyWithImpl;
@override @useResult
$Res call({
 UserInfoEntity editedUserInfo, XFile? avatarFile, LoadStatus updateStatus, LoadStatus uploadStatus, bool isEditing
});


@override $UserInfoEntityCopyWith<$Res> get editedUserInfo;

}
/// @nodoc
class __$ChangeUserInfoStateCopyWithImpl<$Res>
    implements _$ChangeUserInfoStateCopyWith<$Res> {
  __$ChangeUserInfoStateCopyWithImpl(this._self, this._then);

  final _ChangeUserInfoState _self;
  final $Res Function(_ChangeUserInfoState) _then;

/// Create a copy of ChangeUserInfoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? editedUserInfo = null,Object? avatarFile = freezed,Object? updateStatus = null,Object? uploadStatus = null,Object? isEditing = null,}) {
  return _then(_ChangeUserInfoState(
editedUserInfo: null == editedUserInfo ? _self.editedUserInfo : editedUserInfo // ignore: cast_nullable_to_non_nullable
as UserInfoEntity,avatarFile: freezed == avatarFile ? _self.avatarFile : avatarFile // ignore: cast_nullable_to_non_nullable
as XFile?,updateStatus: null == updateStatus ? _self.updateStatus : updateStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,uploadStatus: null == uploadStatus ? _self.uploadStatus : uploadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,isEditing: null == isEditing ? _self.isEditing : isEditing // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChangeUserInfoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserInfoEntityCopyWith<$Res> get editedUserInfo {
  
  return $UserInfoEntityCopyWith<$Res>(_self.editedUserInfo, (value) {
    return _then(_self.copyWith(editedUserInfo: value));
  });
}
}

// dart format on

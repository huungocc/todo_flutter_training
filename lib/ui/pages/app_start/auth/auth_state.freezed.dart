// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

 LoadStatus get loginLoadStatus; LoadStatus get registerLoadStatus; AuthType get authType; bool get isConfirmed; AuthEntity? get authEntity;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.loginLoadStatus, loginLoadStatus) || other.loginLoadStatus == loginLoadStatus)&&(identical(other.registerLoadStatus, registerLoadStatus) || other.registerLoadStatus == registerLoadStatus)&&(identical(other.authType, authType) || other.authType == authType)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed)&&(identical(other.authEntity, authEntity) || other.authEntity == authEntity));
}


@override
int get hashCode => Object.hash(runtimeType,loginLoadStatus,registerLoadStatus,authType,isConfirmed,authEntity);

@override
String toString() {
  return 'AuthState(loginLoadStatus: $loginLoadStatus, registerLoadStatus: $registerLoadStatus, authType: $authType, isConfirmed: $isConfirmed, authEntity: $authEntity)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus loginLoadStatus, LoadStatus registerLoadStatus, AuthType authType, bool isConfirmed, AuthEntity? authEntity
});


$AuthEntityCopyWith<$Res>? get authEntity;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loginLoadStatus = null,Object? registerLoadStatus = null,Object? authType = null,Object? isConfirmed = null,Object? authEntity = freezed,}) {
  return _then(_self.copyWith(
loginLoadStatus: null == loginLoadStatus ? _self.loginLoadStatus : loginLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,registerLoadStatus: null == registerLoadStatus ? _self.registerLoadStatus : registerLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,authType: null == authType ? _self.authType : authType // ignore: cast_nullable_to_non_nullable
as AuthType,isConfirmed: null == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool,authEntity: freezed == authEntity ? _self.authEntity : authEntity // ignore: cast_nullable_to_non_nullable
as AuthEntity?,
  ));
}
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthEntityCopyWith<$Res>? get authEntity {
    if (_self.authEntity == null) {
    return null;
  }

  return $AuthEntityCopyWith<$Res>(_self.authEntity!, (value) {
    return _then(_self.copyWith(authEntity: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus loginLoadStatus,  LoadStatus registerLoadStatus,  AuthType authType,  bool isConfirmed,  AuthEntity? authEntity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.loginLoadStatus,_that.registerLoadStatus,_that.authType,_that.isConfirmed,_that.authEntity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus loginLoadStatus,  LoadStatus registerLoadStatus,  AuthType authType,  bool isConfirmed,  AuthEntity? authEntity)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.loginLoadStatus,_that.registerLoadStatus,_that.authType,_that.isConfirmed,_that.authEntity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus loginLoadStatus,  LoadStatus registerLoadStatus,  AuthType authType,  bool isConfirmed,  AuthEntity? authEntity)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.loginLoadStatus,_that.registerLoadStatus,_that.authType,_that.isConfirmed,_that.authEntity);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
  const _AuthState({this.loginLoadStatus = LoadStatus.initial, this.registerLoadStatus = LoadStatus.initial, this.authType = AuthType.login, this.isConfirmed = false, this.authEntity});
  

@override@JsonKey() final  LoadStatus loginLoadStatus;
@override@JsonKey() final  LoadStatus registerLoadStatus;
@override@JsonKey() final  AuthType authType;
@override@JsonKey() final  bool isConfirmed;
@override final  AuthEntity? authEntity;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.loginLoadStatus, loginLoadStatus) || other.loginLoadStatus == loginLoadStatus)&&(identical(other.registerLoadStatus, registerLoadStatus) || other.registerLoadStatus == registerLoadStatus)&&(identical(other.authType, authType) || other.authType == authType)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed)&&(identical(other.authEntity, authEntity) || other.authEntity == authEntity));
}


@override
int get hashCode => Object.hash(runtimeType,loginLoadStatus,registerLoadStatus,authType,isConfirmed,authEntity);

@override
String toString() {
  return 'AuthState(loginLoadStatus: $loginLoadStatus, registerLoadStatus: $registerLoadStatus, authType: $authType, isConfirmed: $isConfirmed, authEntity: $authEntity)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus loginLoadStatus, LoadStatus registerLoadStatus, AuthType authType, bool isConfirmed, AuthEntity? authEntity
});


@override $AuthEntityCopyWith<$Res>? get authEntity;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loginLoadStatus = null,Object? registerLoadStatus = null,Object? authType = null,Object? isConfirmed = null,Object? authEntity = freezed,}) {
  return _then(_AuthState(
loginLoadStatus: null == loginLoadStatus ? _self.loginLoadStatus : loginLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,registerLoadStatus: null == registerLoadStatus ? _self.registerLoadStatus : registerLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,authType: null == authType ? _self.authType : authType // ignore: cast_nullable_to_non_nullable
as AuthType,isConfirmed: null == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool,authEntity: freezed == authEntity ? _self.authEntity : authEntity // ignore: cast_nullable_to_non_nullable
as AuthEntity?,
  ));
}

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthEntityCopyWith<$Res>? get authEntity {
    if (_self.authEntity == null) {
    return null;
  }

  return $AuthEntityCopyWith<$Res>(_self.authEntity!, (value) {
    return _then(_self.copyWith(authEntity: value));
  });
}
}

// dart format on

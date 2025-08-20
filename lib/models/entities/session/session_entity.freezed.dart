// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionEntity {

@JsonKey(name: 'access_token') String get accessToken;@JsonKey(name: 'refresh_token') String get refreshToken;@JsonKey(name: 'expires_in') int? get expiresIn;@JsonKey(name: 'token_type') String? get tokenType;
/// Create a copy of SessionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionEntityCopyWith<SessionEntity> get copyWith => _$SessionEntityCopyWithImpl<SessionEntity>(this as SessionEntity, _$identity);

  /// Serializes this SessionEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresIn,tokenType);

@override
String toString() {
  return 'SessionEntity(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class $SessionEntityCopyWith<$Res>  {
  factory $SessionEntityCopyWith(SessionEntity value, $Res Function(SessionEntity) _then) = _$SessionEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int? expiresIn,@JsonKey(name: 'token_type') String? tokenType
});




}
/// @nodoc
class _$SessionEntityCopyWithImpl<$Res>
    implements $SessionEntityCopyWith<$Res> {
  _$SessionEntityCopyWithImpl(this._self, this._then);

  final SessionEntity _self;
  final $Res Function(SessionEntity) _then;

/// Create a copy of SessionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = freezed,Object? tokenType = freezed,}) {
  return _then(_self.copyWith(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionEntity].
extension SessionEntityPatterns on SessionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionEntity value)  $default,){
final _that = this;
switch (_that) {
case _SessionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SessionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'token_type')  String? tokenType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionEntity() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.tokenType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'token_type')  String? tokenType)  $default,) {final _that = this;
switch (_that) {
case _SessionEntity():
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.tokenType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'access_token')  String accessToken, @JsonKey(name: 'refresh_token')  String refreshToken, @JsonKey(name: 'expires_in')  int? expiresIn, @JsonKey(name: 'token_type')  String? tokenType)?  $default,) {final _that = this;
switch (_that) {
case _SessionEntity() when $default != null:
return $default(_that.accessToken,_that.refreshToken,_that.expiresIn,_that.tokenType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionEntity implements SessionEntity {
  const _SessionEntity({@JsonKey(name: 'access_token') required this.accessToken, @JsonKey(name: 'refresh_token') required this.refreshToken, @JsonKey(name: 'expires_in') this.expiresIn, @JsonKey(name: 'token_type') this.tokenType});
  factory _SessionEntity.fromJson(Map<String, dynamic> json) => _$SessionEntityFromJson(json);

@override@JsonKey(name: 'access_token') final  String accessToken;
@override@JsonKey(name: 'refresh_token') final  String refreshToken;
@override@JsonKey(name: 'expires_in') final  int? expiresIn;
@override@JsonKey(name: 'token_type') final  String? tokenType;

/// Create a copy of SessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionEntityCopyWith<_SessionEntity> get copyWith => __$SessionEntityCopyWithImpl<_SessionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionEntity&&(identical(other.accessToken, accessToken) || other.accessToken == accessToken)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accessToken,refreshToken,expiresIn,tokenType);

@override
String toString() {
  return 'SessionEntity(accessToken: $accessToken, refreshToken: $refreshToken, expiresIn: $expiresIn, tokenType: $tokenType)';
}


}

/// @nodoc
abstract mixin class _$SessionEntityCopyWith<$Res> implements $SessionEntityCopyWith<$Res> {
  factory _$SessionEntityCopyWith(_SessionEntity value, $Res Function(_SessionEntity) _then) = __$SessionEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'access_token') String accessToken,@JsonKey(name: 'refresh_token') String refreshToken,@JsonKey(name: 'expires_in') int? expiresIn,@JsonKey(name: 'token_type') String? tokenType
});




}
/// @nodoc
class __$SessionEntityCopyWithImpl<$Res>
    implements _$SessionEntityCopyWith<$Res> {
  __$SessionEntityCopyWithImpl(this._self, this._then);

  final _SessionEntity _self;
  final $Res Function(_SessionEntity) _then;

/// Create a copy of SessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accessToken = null,Object? refreshToken = null,Object? expiresIn = freezed,Object? tokenType = freezed,}) {
  return _then(_SessionEntity(
accessToken: null == accessToken ? _self.accessToken : accessToken // ignore: cast_nullable_to_non_nullable
as String,refreshToken: null == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String,expiresIn: freezed == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int?,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

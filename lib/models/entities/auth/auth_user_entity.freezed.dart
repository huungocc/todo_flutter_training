// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthUserEntity {

@JsonKey(includeIfNull: false) String? get id; String? get email; bool get isConfirmed;
/// Create a copy of AuthUserEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthUserEntityCopyWith<AuthUserEntity> get copyWith => _$AuthUserEntityCopyWithImpl<AuthUserEntity>(this as AuthUserEntity, _$identity);

  /// Serializes this AuthUserEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,isConfirmed);

@override
String toString() {
  return 'AuthUserEntity(id: $id, email: $email, isConfirmed: $isConfirmed)';
}


}

/// @nodoc
abstract mixin class $AuthUserEntityCopyWith<$Res>  {
  factory $AuthUserEntityCopyWith(AuthUserEntity value, $Res Function(AuthUserEntity) _then) = _$AuthUserEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String? email, bool isConfirmed
});




}
/// @nodoc
class _$AuthUserEntityCopyWithImpl<$Res>
    implements $AuthUserEntityCopyWith<$Res> {
  _$AuthUserEntityCopyWithImpl(this._self, this._then);

  final AuthUserEntity _self;
  final $Res Function(AuthUserEntity) _then;

/// Create a copy of AuthUserEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? email = freezed,Object? isConfirmed = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isConfirmed: null == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthUserEntity].
extension AuthUserEntityPatterns on AuthUserEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthUserEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthUserEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthUserEntity value)  $default,){
final _that = this;
switch (_that) {
case _AuthUserEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthUserEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AuthUserEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String? email,  bool isConfirmed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthUserEntity() when $default != null:
return $default(_that.id,_that.email,_that.isConfirmed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id,  String? email,  bool isConfirmed)  $default,) {final _that = this;
switch (_that) {
case _AuthUserEntity():
return $default(_that.id,_that.email,_that.isConfirmed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id,  String? email,  bool isConfirmed)?  $default,) {final _that = this;
switch (_that) {
case _AuthUserEntity() when $default != null:
return $default(_that.id,_that.email,_that.isConfirmed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthUserEntity implements AuthUserEntity {
  const _AuthUserEntity({@JsonKey(includeIfNull: false) this.id, this.email, this.isConfirmed = false});
  factory _AuthUserEntity.fromJson(Map<String, dynamic> json) => _$AuthUserEntityFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override final  String? email;
@override@JsonKey() final  bool isConfirmed;

/// Create a copy of AuthUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthUserEntityCopyWith<_AuthUserEntity> get copyWith => __$AuthUserEntityCopyWithImpl<_AuthUserEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthUserEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthUserEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.isConfirmed, isConfirmed) || other.isConfirmed == isConfirmed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,isConfirmed);

@override
String toString() {
  return 'AuthUserEntity(id: $id, email: $email, isConfirmed: $isConfirmed)';
}


}

/// @nodoc
abstract mixin class _$AuthUserEntityCopyWith<$Res> implements $AuthUserEntityCopyWith<$Res> {
  factory _$AuthUserEntityCopyWith(_AuthUserEntity value, $Res Function(_AuthUserEntity) _then) = __$AuthUserEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id, String? email, bool isConfirmed
});




}
/// @nodoc
class __$AuthUserEntityCopyWithImpl<$Res>
    implements _$AuthUserEntityCopyWith<$Res> {
  __$AuthUserEntityCopyWithImpl(this._self, this._then);

  final _AuthUserEntity _self;
  final $Res Function(_AuthUserEntity) _then;

/// Create a copy of AuthUserEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? email = freezed,Object? isConfirmed = null,}) {
  return _then(_AuthUserEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,isConfirmed: null == isConfirmed ? _self.isConfirmed : isConfirmed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

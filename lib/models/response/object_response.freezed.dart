// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'object_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ObjectResponse<T> {

 String get message; T? get data;
/// Create a copy of ObjectResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ObjectResponseCopyWith<T, ObjectResponse<T>> get copyWith => _$ObjectResponseCopyWithImpl<T, ObjectResponse<T>>(this as ObjectResponse<T>, _$identity);

  /// Serializes this ObjectResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ObjectResponse<T>&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ObjectResponse<$T>(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ObjectResponseCopyWith<T,$Res>  {
  factory $ObjectResponseCopyWith(ObjectResponse<T> value, $Res Function(ObjectResponse<T>) _then) = _$ObjectResponseCopyWithImpl;
@useResult
$Res call({
 String message, T? data
});




}
/// @nodoc
class _$ObjectResponseCopyWithImpl<T,$Res>
    implements $ObjectResponseCopyWith<T, $Res> {
  _$ObjectResponseCopyWithImpl(this._self, this._then);

  final ObjectResponse<T> _self;
  final $Res Function(ObjectResponse<T>) _then;

/// Create a copy of ObjectResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}

}


/// Adds pattern-matching-related methods to [ObjectResponse].
extension ObjectResponsePatterns<T> on ObjectResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ObjectResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ObjectResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ObjectResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _ObjectResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ObjectResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ObjectResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  T? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ObjectResponse() when $default != null:
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  T? data)  $default,) {final _that = this;
switch (_that) {
case _ObjectResponse():
return $default(_that.message,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  T? data)?  $default,) {final _that = this;
switch (_that) {
case _ObjectResponse() when $default != null:
return $default(_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ObjectResponse<T> implements ObjectResponse<T> {
  const _ObjectResponse({this.message = "", this.data});
  factory _ObjectResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ObjectResponseFromJson(json,fromJsonT);

@override@JsonKey() final  String message;
@override final  T? data;

/// Create a copy of ObjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ObjectResponseCopyWith<T, _ObjectResponse<T>> get copyWith => __$ObjectResponseCopyWithImpl<T, _ObjectResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ObjectResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ObjectResponse<T>&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ObjectResponse<$T>(message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ObjectResponseCopyWith<T,$Res> implements $ObjectResponseCopyWith<T, $Res> {
  factory _$ObjectResponseCopyWith(_ObjectResponse<T> value, $Res Function(_ObjectResponse<T>) _then) = __$ObjectResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, T? data
});




}
/// @nodoc
class __$ObjectResponseCopyWithImpl<T,$Res>
    implements _$ObjectResponseCopyWith<T, $Res> {
  __$ObjectResponseCopyWithImpl(this._self, this._then);

  final _ObjectResponse<T> _self;
  final $Res Function(_ObjectResponse<T>) _then;

/// Create a copy of ObjectResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? data = freezed,}) {
  return _then(_ObjectResponse<T>(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T?,
  ));
}


}

// dart format on

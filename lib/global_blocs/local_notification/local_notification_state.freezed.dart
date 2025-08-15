// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'local_notification_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocalNotificationState {

 LoadStatus get loadStatus; String? get errorMessage; String? get successMessage;
/// Create a copy of LocalNotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalNotificationStateCopyWith<LocalNotificationState> get copyWith => _$LocalNotificationStateCopyWithImpl<LocalNotificationState>(this as LocalNotificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalNotificationState&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loadStatus,errorMessage,successMessage);

@override
String toString() {
  return 'LocalNotificationState(loadStatus: $loadStatus, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $LocalNotificationStateCopyWith<$Res>  {
  factory $LocalNotificationStateCopyWith(LocalNotificationState value, $Res Function(LocalNotificationState) _then) = _$LocalNotificationStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus loadStatus, String? errorMessage, String? successMessage
});




}
/// @nodoc
class _$LocalNotificationStateCopyWithImpl<$Res>
    implements $LocalNotificationStateCopyWith<$Res> {
  _$LocalNotificationStateCopyWithImpl(this._self, this._then);

  final LocalNotificationState _self;
  final $Res Function(LocalNotificationState) _then;

/// Create a copy of LocalNotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadStatus = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalNotificationState].
extension LocalNotificationStatePatterns on LocalNotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalNotificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalNotificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalNotificationState value)  $default,){
final _that = this;
switch (_that) {
case _LocalNotificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalNotificationState value)?  $default,){
final _that = this;
switch (_that) {
case _LocalNotificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus loadStatus,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalNotificationState() when $default != null:
return $default(_that.loadStatus,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus loadStatus,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _LocalNotificationState():
return $default(_that.loadStatus,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus loadStatus,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _LocalNotificationState() when $default != null:
return $default(_that.loadStatus,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _LocalNotificationState implements LocalNotificationState {
  const _LocalNotificationState({this.loadStatus = LoadStatus.initial, this.errorMessage, this.successMessage});
  

@override@JsonKey() final  LoadStatus loadStatus;
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of LocalNotificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalNotificationStateCopyWith<_LocalNotificationState> get copyWith => __$LocalNotificationStateCopyWithImpl<_LocalNotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalNotificationState&&(identical(other.loadStatus, loadStatus) || other.loadStatus == loadStatus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,loadStatus,errorMessage,successMessage);

@override
String toString() {
  return 'LocalNotificationState(loadStatus: $loadStatus, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$LocalNotificationStateCopyWith<$Res> implements $LocalNotificationStateCopyWith<$Res> {
  factory _$LocalNotificationStateCopyWith(_LocalNotificationState value, $Res Function(_LocalNotificationState) _then) = __$LocalNotificationStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus loadStatus, String? errorMessage, String? successMessage
});




}
/// @nodoc
class __$LocalNotificationStateCopyWithImpl<$Res>
    implements _$LocalNotificationStateCopyWith<$Res> {
  __$LocalNotificationStateCopyWithImpl(this._self, this._then);

  final _LocalNotificationState _self;
  final $Res Function(_LocalNotificationState) _then;

/// Create a copy of LocalNotificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadStatus = null,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_LocalNotificationState(
loadStatus: null == loadStatus ? _self.loadStatus : loadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

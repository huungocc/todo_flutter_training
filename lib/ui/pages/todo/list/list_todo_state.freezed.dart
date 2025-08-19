// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListTodoState {

 LoadStatus get activeLoadStatus; LoadStatus get completedLoadStatus; List<TodoEntity> get activeTodos; List<TodoEntity> get completedTodos;
/// Create a copy of ListTodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListTodoStateCopyWith<ListTodoState> get copyWith => _$ListTodoStateCopyWithImpl<ListTodoState>(this as ListTodoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListTodoState&&(identical(other.activeLoadStatus, activeLoadStatus) || other.activeLoadStatus == activeLoadStatus)&&(identical(other.completedLoadStatus, completedLoadStatus) || other.completedLoadStatus == completedLoadStatus)&&const DeepCollectionEquality().equals(other.activeTodos, activeTodos)&&const DeepCollectionEquality().equals(other.completedTodos, completedTodos));
}


@override
int get hashCode => Object.hash(runtimeType,activeLoadStatus,completedLoadStatus,const DeepCollectionEquality().hash(activeTodos),const DeepCollectionEquality().hash(completedTodos));

@override
String toString() {
  return 'ListTodoState(activeLoadStatus: $activeLoadStatus, completedLoadStatus: $completedLoadStatus, activeTodos: $activeTodos, completedTodos: $completedTodos)';
}


}

/// @nodoc
abstract mixin class $ListTodoStateCopyWith<$Res>  {
  factory $ListTodoStateCopyWith(ListTodoState value, $Res Function(ListTodoState) _then) = _$ListTodoStateCopyWithImpl;
@useResult
$Res call({
 LoadStatus activeLoadStatus, LoadStatus completedLoadStatus, List<TodoEntity> activeTodos, List<TodoEntity> completedTodos
});




}
/// @nodoc
class _$ListTodoStateCopyWithImpl<$Res>
    implements $ListTodoStateCopyWith<$Res> {
  _$ListTodoStateCopyWithImpl(this._self, this._then);

  final ListTodoState _self;
  final $Res Function(ListTodoState) _then;

/// Create a copy of ListTodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? activeLoadStatus = null,Object? completedLoadStatus = null,Object? activeTodos = null,Object? completedTodos = null,}) {
  return _then(_self.copyWith(
activeLoadStatus: null == activeLoadStatus ? _self.activeLoadStatus : activeLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,completedLoadStatus: null == completedLoadStatus ? _self.completedLoadStatus : completedLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,activeTodos: null == activeTodos ? _self.activeTodos : activeTodos // ignore: cast_nullable_to_non_nullable
as List<TodoEntity>,completedTodos: null == completedTodos ? _self.completedTodos : completedTodos // ignore: cast_nullable_to_non_nullable
as List<TodoEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [ListTodoState].
extension ListTodoStatePatterns on ListTodoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListTodoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListTodoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListTodoState value)  $default,){
final _that = this;
switch (_that) {
case _ListTodoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListTodoState value)?  $default,){
final _that = this;
switch (_that) {
case _ListTodoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LoadStatus activeLoadStatus,  LoadStatus completedLoadStatus,  List<TodoEntity> activeTodos,  List<TodoEntity> completedTodos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListTodoState() when $default != null:
return $default(_that.activeLoadStatus,_that.completedLoadStatus,_that.activeTodos,_that.completedTodos);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LoadStatus activeLoadStatus,  LoadStatus completedLoadStatus,  List<TodoEntity> activeTodos,  List<TodoEntity> completedTodos)  $default,) {final _that = this;
switch (_that) {
case _ListTodoState():
return $default(_that.activeLoadStatus,_that.completedLoadStatus,_that.activeTodos,_that.completedTodos);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LoadStatus activeLoadStatus,  LoadStatus completedLoadStatus,  List<TodoEntity> activeTodos,  List<TodoEntity> completedTodos)?  $default,) {final _that = this;
switch (_that) {
case _ListTodoState() when $default != null:
return $default(_that.activeLoadStatus,_that.completedLoadStatus,_that.activeTodos,_that.completedTodos);case _:
  return null;

}
}

}

/// @nodoc


class _ListTodoState implements ListTodoState {
  const _ListTodoState({this.activeLoadStatus = LoadStatus.initial, this.completedLoadStatus = LoadStatus.initial, final  List<TodoEntity> activeTodos = const [], final  List<TodoEntity> completedTodos = const []}): _activeTodos = activeTodos,_completedTodos = completedTodos;
  

@override@JsonKey() final  LoadStatus activeLoadStatus;
@override@JsonKey() final  LoadStatus completedLoadStatus;
 final  List<TodoEntity> _activeTodos;
@override@JsonKey() List<TodoEntity> get activeTodos {
  if (_activeTodos is EqualUnmodifiableListView) return _activeTodos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_activeTodos);
}

 final  List<TodoEntity> _completedTodos;
@override@JsonKey() List<TodoEntity> get completedTodos {
  if (_completedTodos is EqualUnmodifiableListView) return _completedTodos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedTodos);
}


/// Create a copy of ListTodoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListTodoStateCopyWith<_ListTodoState> get copyWith => __$ListTodoStateCopyWithImpl<_ListTodoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListTodoState&&(identical(other.activeLoadStatus, activeLoadStatus) || other.activeLoadStatus == activeLoadStatus)&&(identical(other.completedLoadStatus, completedLoadStatus) || other.completedLoadStatus == completedLoadStatus)&&const DeepCollectionEquality().equals(other._activeTodos, _activeTodos)&&const DeepCollectionEquality().equals(other._completedTodos, _completedTodos));
}


@override
int get hashCode => Object.hash(runtimeType,activeLoadStatus,completedLoadStatus,const DeepCollectionEquality().hash(_activeTodos),const DeepCollectionEquality().hash(_completedTodos));

@override
String toString() {
  return 'ListTodoState(activeLoadStatus: $activeLoadStatus, completedLoadStatus: $completedLoadStatus, activeTodos: $activeTodos, completedTodos: $completedTodos)';
}


}

/// @nodoc
abstract mixin class _$ListTodoStateCopyWith<$Res> implements $ListTodoStateCopyWith<$Res> {
  factory _$ListTodoStateCopyWith(_ListTodoState value, $Res Function(_ListTodoState) _then) = __$ListTodoStateCopyWithImpl;
@override @useResult
$Res call({
 LoadStatus activeLoadStatus, LoadStatus completedLoadStatus, List<TodoEntity> activeTodos, List<TodoEntity> completedTodos
});




}
/// @nodoc
class __$ListTodoStateCopyWithImpl<$Res>
    implements _$ListTodoStateCopyWith<$Res> {
  __$ListTodoStateCopyWithImpl(this._self, this._then);

  final _ListTodoState _self;
  final $Res Function(_ListTodoState) _then;

/// Create a copy of ListTodoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? activeLoadStatus = null,Object? completedLoadStatus = null,Object? activeTodos = null,Object? completedTodos = null,}) {
  return _then(_ListTodoState(
activeLoadStatus: null == activeLoadStatus ? _self.activeLoadStatus : activeLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,completedLoadStatus: null == completedLoadStatus ? _self.completedLoadStatus : completedLoadStatus // ignore: cast_nullable_to_non_nullable
as LoadStatus,activeTodos: null == activeTodos ? _self._activeTodos : activeTodos // ignore: cast_nullable_to_non_nullable
as List<TodoEntity>,completedTodos: null == completedTodos ? _self._completedTodos : completedTodos // ignore: cast_nullable_to_non_nullable
as List<TodoEntity>,
  ));
}


}

// dart format on

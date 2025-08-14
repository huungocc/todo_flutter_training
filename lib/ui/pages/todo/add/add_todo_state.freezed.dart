// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_todo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AddTodoState {

 TodoEntity get todo; String? get errorMessage; String? get successMessage; LoadStatus get status; OperationStatus get operation; TodoItemType get selectedType;
/// Create a copy of AddTodoState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTodoStateCopyWith<AddTodoState> get copyWith => _$AddTodoStateCopyWithImpl<AddTodoState>(this as AddTodoState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTodoState&&(identical(other.todo, todo) || other.todo == todo)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.status, status) || other.status == status)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType));
}


@override
int get hashCode => Object.hash(runtimeType,todo,errorMessage,successMessage,status,operation,selectedType);

@override
String toString() {
  return 'AddTodoState(todo: $todo, errorMessage: $errorMessage, successMessage: $successMessage, status: $status, operation: $operation, selectedType: $selectedType)';
}


}

/// @nodoc
abstract mixin class $AddTodoStateCopyWith<$Res>  {
  factory $AddTodoStateCopyWith(AddTodoState value, $Res Function(AddTodoState) _then) = _$AddTodoStateCopyWithImpl;
@useResult
$Res call({
 TodoEntity todo, String? errorMessage, String? successMessage, LoadStatus status, OperationStatus operation, TodoItemType selectedType
});


$TodoEntityCopyWith<$Res> get todo;

}
/// @nodoc
class _$AddTodoStateCopyWithImpl<$Res>
    implements $AddTodoStateCopyWith<$Res> {
  _$AddTodoStateCopyWithImpl(this._self, this._then);

  final AddTodoState _self;
  final $Res Function(AddTodoState) _then;

/// Create a copy of AddTodoState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todo = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? status = null,Object? operation = null,Object? selectedType = null,}) {
  return _then(_self.copyWith(
todo: null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as TodoEntity,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as OperationStatus,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as TodoItemType,
  ));
}
/// Create a copy of AddTodoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoEntityCopyWith<$Res> get todo {
  
  return $TodoEntityCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}


/// Adds pattern-matching-related methods to [AddTodoState].
extension AddTodoStatePatterns on AddTodoState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddTodoState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTodoState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddTodoState value)  $default,){
final _that = this;
switch (_that) {
case _AddTodoState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddTodoState value)?  $default,){
final _that = this;
switch (_that) {
case _AddTodoState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TodoEntity todo,  String? errorMessage,  String? successMessage,  LoadStatus status,  OperationStatus operation,  TodoItemType selectedType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTodoState() when $default != null:
return $default(_that.todo,_that.errorMessage,_that.successMessage,_that.status,_that.operation,_that.selectedType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TodoEntity todo,  String? errorMessage,  String? successMessage,  LoadStatus status,  OperationStatus operation,  TodoItemType selectedType)  $default,) {final _that = this;
switch (_that) {
case _AddTodoState():
return $default(_that.todo,_that.errorMessage,_that.successMessage,_that.status,_that.operation,_that.selectedType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TodoEntity todo,  String? errorMessage,  String? successMessage,  LoadStatus status,  OperationStatus operation,  TodoItemType selectedType)?  $default,) {final _that = this;
switch (_that) {
case _AddTodoState() when $default != null:
return $default(_that.todo,_that.errorMessage,_that.successMessage,_that.status,_that.operation,_that.selectedType);case _:
  return null;

}
}

}

/// @nodoc


class _AddTodoState implements AddTodoState {
  const _AddTodoState({this.todo = const TodoEntity(), this.errorMessage, this.successMessage, this.status = LoadStatus.initial, this.operation = OperationStatus.none, this.selectedType = TodoItemType.list});
  

@override@JsonKey() final  TodoEntity todo;
@override final  String? errorMessage;
@override final  String? successMessage;
@override@JsonKey() final  LoadStatus status;
@override@JsonKey() final  OperationStatus operation;
@override@JsonKey() final  TodoItemType selectedType;

/// Create a copy of AddTodoState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTodoStateCopyWith<_AddTodoState> get copyWith => __$AddTodoStateCopyWithImpl<_AddTodoState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTodoState&&(identical(other.todo, todo) || other.todo == todo)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage)&&(identical(other.status, status) || other.status == status)&&(identical(other.operation, operation) || other.operation == operation)&&(identical(other.selectedType, selectedType) || other.selectedType == selectedType));
}


@override
int get hashCode => Object.hash(runtimeType,todo,errorMessage,successMessage,status,operation,selectedType);

@override
String toString() {
  return 'AddTodoState(todo: $todo, errorMessage: $errorMessage, successMessage: $successMessage, status: $status, operation: $operation, selectedType: $selectedType)';
}


}

/// @nodoc
abstract mixin class _$AddTodoStateCopyWith<$Res> implements $AddTodoStateCopyWith<$Res> {
  factory _$AddTodoStateCopyWith(_AddTodoState value, $Res Function(_AddTodoState) _then) = __$AddTodoStateCopyWithImpl;
@override @useResult
$Res call({
 TodoEntity todo, String? errorMessage, String? successMessage, LoadStatus status, OperationStatus operation, TodoItemType selectedType
});


@override $TodoEntityCopyWith<$Res> get todo;

}
/// @nodoc
class __$AddTodoStateCopyWithImpl<$Res>
    implements _$AddTodoStateCopyWith<$Res> {
  __$AddTodoStateCopyWithImpl(this._self, this._then);

  final _AddTodoState _self;
  final $Res Function(_AddTodoState) _then;

/// Create a copy of AddTodoState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todo = null,Object? errorMessage = freezed,Object? successMessage = freezed,Object? status = null,Object? operation = null,Object? selectedType = null,}) {
  return _then(_AddTodoState(
todo: null == todo ? _self.todo : todo // ignore: cast_nullable_to_non_nullable
as TodoEntity,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as LoadStatus,operation: null == operation ? _self.operation : operation // ignore: cast_nullable_to_non_nullable
as OperationStatus,selectedType: null == selectedType ? _self.selectedType : selectedType // ignore: cast_nullable_to_non_nullable
as TodoItemType,
  ));
}

/// Create a copy of AddTodoState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TodoEntityCopyWith<$Res> get todo {
  
  return $TodoEntityCopyWith<$Res>(_self.todo, (value) {
    return _then(_self.copyWith(todo: value));
  });
}
}

// dart format on

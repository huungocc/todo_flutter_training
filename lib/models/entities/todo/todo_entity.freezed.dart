// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoEntity {

@JsonKey(includeIfNull: false) String? get id;@JsonKey(name: 'task_title') String? get taskTitle; String? get category; DateTime? get date; String? get time; String? get notes; bool get completed;
/// Create a copy of TodoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoEntityCopyWith<TodoEntity> get copyWith => _$TodoEntityCopyWithImpl<TodoEntity>(this as TodoEntity, _$identity);

  /// Serializes this TodoEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.taskTitle, taskTitle) || other.taskTitle == taskTitle)&&(identical(other.category, category) || other.category == category)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskTitle,category,date,time,notes,completed);

@override
String toString() {
  return 'TodoEntity(id: $id, taskTitle: $taskTitle, category: $category, date: $date, time: $time, notes: $notes, completed: $completed)';
}


}

/// @nodoc
abstract mixin class $TodoEntityCopyWith<$Res>  {
  factory $TodoEntityCopyWith(TodoEntity value, $Res Function(TodoEntity) _then) = _$TodoEntityCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@JsonKey(name: 'task_title') String? taskTitle, String? category, DateTime? date, String? time, String? notes, bool completed
});




}
/// @nodoc
class _$TodoEntityCopyWithImpl<$Res>
    implements $TodoEntityCopyWith<$Res> {
  _$TodoEntityCopyWithImpl(this._self, this._then);

  final TodoEntity _self;
  final $Res Function(TodoEntity) _then;

/// Create a copy of TodoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? taskTitle = freezed,Object? category = freezed,Object? date = freezed,Object? time = freezed,Object? notes = freezed,Object? completed = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,taskTitle: freezed == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoEntity].
extension TodoEntityPatterns on TodoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoEntity value)  $default,){
final _that = this;
switch (_that) {
case _TodoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TodoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(name: 'task_title')  String? taskTitle,  String? category,  DateTime? date,  String? time,  String? notes,  bool completed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoEntity() when $default != null:
return $default(_that.id,_that.taskTitle,_that.category,_that.date,_that.time,_that.notes,_that.completed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(name: 'task_title')  String? taskTitle,  String? category,  DateTime? date,  String? time,  String? notes,  bool completed)  $default,) {final _that = this;
switch (_that) {
case _TodoEntity():
return $default(_that.id,_that.taskTitle,_that.category,_that.date,_that.time,_that.notes,_that.completed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeIfNull: false)  String? id, @JsonKey(name: 'task_title')  String? taskTitle,  String? category,  DateTime? date,  String? time,  String? notes,  bool completed)?  $default,) {final _that = this;
switch (_that) {
case _TodoEntity() when $default != null:
return $default(_that.id,_that.taskTitle,_that.category,_that.date,_that.time,_that.notes,_that.completed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodoEntity implements TodoEntity {
  const _TodoEntity({@JsonKey(includeIfNull: false) this.id, @JsonKey(name: 'task_title') this.taskTitle, this.category, this.date, this.time, this.notes, this.completed = false});
  factory _TodoEntity.fromJson(Map<String, dynamic> json) => _$TodoEntityFromJson(json);

@override@JsonKey(includeIfNull: false) final  String? id;
@override@JsonKey(name: 'task_title') final  String? taskTitle;
@override final  String? category;
@override final  DateTime? date;
@override final  String? time;
@override final  String? notes;
@override@JsonKey() final  bool completed;

/// Create a copy of TodoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoEntityCopyWith<_TodoEntity> get copyWith => __$TodoEntityCopyWithImpl<_TodoEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.taskTitle, taskTitle) || other.taskTitle == taskTitle)&&(identical(other.category, category) || other.category == category)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.completed, completed) || other.completed == completed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,taskTitle,category,date,time,notes,completed);

@override
String toString() {
  return 'TodoEntity(id: $id, taskTitle: $taskTitle, category: $category, date: $date, time: $time, notes: $notes, completed: $completed)';
}


}

/// @nodoc
abstract mixin class _$TodoEntityCopyWith<$Res> implements $TodoEntityCopyWith<$Res> {
  factory _$TodoEntityCopyWith(_TodoEntity value, $Res Function(_TodoEntity) _then) = __$TodoEntityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeIfNull: false) String? id,@JsonKey(name: 'task_title') String? taskTitle, String? category, DateTime? date, String? time, String? notes, bool completed
});




}
/// @nodoc
class __$TodoEntityCopyWithImpl<$Res>
    implements _$TodoEntityCopyWith<$Res> {
  __$TodoEntityCopyWithImpl(this._self, this._then);

  final _TodoEntity _self;
  final $Res Function(_TodoEntity) _then;

/// Create a copy of TodoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? taskTitle = freezed,Object? category = freezed,Object? date = freezed,Object? time = freezed,Object? notes = freezed,Object? completed = null,}) {
  return _then(_TodoEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,taskTitle: freezed == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,time: freezed == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

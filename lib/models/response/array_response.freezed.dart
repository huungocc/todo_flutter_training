// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'array_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArrayResponse<T> {

 int get page;@JsonKey(name: "total_pages") int get totalPages;@JsonKey(name: "total_results") int get totalResults;@JsonKey(defaultValue: []) List<T> get results;
/// Create a copy of ArrayResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArrayResponseCopyWith<T, ArrayResponse<T>> get copyWith => _$ArrayResponseCopyWithImpl<T, ArrayResponse<T>>(this as ArrayResponse<T>, _$identity);

  /// Serializes this ArrayResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT);


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArrayResponse<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'ArrayResponse<$T>(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class $ArrayResponseCopyWith<T,$Res>  {
  factory $ArrayResponseCopyWith(ArrayResponse<T> value, $Res Function(ArrayResponse<T>) _then) = _$ArrayResponseCopyWithImpl;
@useResult
$Res call({
 int page,@JsonKey(name: "total_pages") int totalPages,@JsonKey(name: "total_results") int totalResults,@JsonKey(defaultValue: []) List<T> results
});




}
/// @nodoc
class _$ArrayResponseCopyWithImpl<T,$Res>
    implements $ArrayResponseCopyWith<T, $Res> {
  _$ArrayResponseCopyWithImpl(this._self, this._then);

  final ArrayResponse<T> _self;
  final $Res Function(ArrayResponse<T>) _then;

/// Create a copy of ArrayResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}

}


/// Adds pattern-matching-related methods to [ArrayResponse].
extension ArrayResponsePatterns<T> on ArrayResponse<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArrayResponse<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArrayResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArrayResponse<T> value)  $default,){
final _that = this;
switch (_that) {
case _ArrayResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArrayResponse<T> value)?  $default,){
final _that = this;
switch (_that) {
case _ArrayResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int page, @JsonKey(name: "total_pages")  int totalPages, @JsonKey(name: "total_results")  int totalResults, @JsonKey(defaultValue: [])  List<T> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArrayResponse() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int page, @JsonKey(name: "total_pages")  int totalPages, @JsonKey(name: "total_results")  int totalResults, @JsonKey(defaultValue: [])  List<T> results)  $default,) {final _that = this;
switch (_that) {
case _ArrayResponse():
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int page, @JsonKey(name: "total_pages")  int totalPages, @JsonKey(name: "total_results")  int totalResults, @JsonKey(defaultValue: [])  List<T> results)?  $default,) {final _that = this;
switch (_that) {
case _ArrayResponse() when $default != null:
return $default(_that.page,_that.totalPages,_that.totalResults,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)

class _ArrayResponse<T> implements ArrayResponse<T> {
  const _ArrayResponse({this.page = 1, @JsonKey(name: "total_pages") this.totalPages = 0, @JsonKey(name: "total_results") this.totalResults = 0, @JsonKey(defaultValue: []) final  List<T> results = const []}): _results = results;
  factory _ArrayResponse.fromJson(Map<String, dynamic> json,T Function(Object?) fromJsonT) => _$ArrayResponseFromJson(json,fromJsonT);

@override@JsonKey() final  int page;
@override@JsonKey(name: "total_pages") final  int totalPages;
@override@JsonKey(name: "total_results") final  int totalResults;
 final  List<T> _results;
@override@JsonKey(defaultValue: []) List<T> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of ArrayResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArrayResponseCopyWith<T, _ArrayResponse<T>> get copyWith => __$ArrayResponseCopyWithImpl<T, _ArrayResponse<T>>(this, _$identity);

@override
Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
  return _$ArrayResponseToJson<T>(this, toJsonT);
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArrayResponse<T>&&(identical(other.page, page) || other.page == page)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,totalPages,totalResults,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'ArrayResponse<$T>(page: $page, totalPages: $totalPages, totalResults: $totalResults, results: $results)';
}


}

/// @nodoc
abstract mixin class _$ArrayResponseCopyWith<T,$Res> implements $ArrayResponseCopyWith<T, $Res> {
  factory _$ArrayResponseCopyWith(_ArrayResponse<T> value, $Res Function(_ArrayResponse<T>) _then) = __$ArrayResponseCopyWithImpl;
@override @useResult
$Res call({
 int page,@JsonKey(name: "total_pages") int totalPages,@JsonKey(name: "total_results") int totalResults,@JsonKey(defaultValue: []) List<T> results
});




}
/// @nodoc
class __$ArrayResponseCopyWithImpl<T,$Res>
    implements _$ArrayResponseCopyWith<T, $Res> {
  __$ArrayResponseCopyWithImpl(this._self, this._then);

  final _ArrayResponse<T> _self;
  final $Res Function(_ArrayResponse<T>) _then;

/// Create a copy of ArrayResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? totalPages = null,Object? totalResults = null,Object? results = null,}) {
  return _then(_ArrayResponse<T>(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<T>,
  ));
}


}

// dart format on

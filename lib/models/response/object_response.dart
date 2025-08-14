import 'package:freezed_annotation/freezed_annotation.dart';

part 'object_response.freezed.dart';
part 'object_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ObjectResponse<T> with _$ObjectResponse<T> {
  const factory ObjectResponse({
    @Default("") String message,
    T? data,
  }) = _ObjectResponse<T>;

  factory ObjectResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) => _$ObjectResponseFromJson(json, fromJsonT);
}

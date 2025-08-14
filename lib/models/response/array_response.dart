import 'package:freezed_annotation/freezed_annotation.dart';

part 'array_response.freezed.dart';
part 'array_response.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class ArrayResponse<T> with _$ArrayResponse<T> {
  const factory ArrayResponse({
    @Default(1) int page,
    @JsonKey(name: "total_pages") @Default(0) int totalPages,
    @JsonKey(name: "total_results") @Default(0) int totalResults,
    @JsonKey(defaultValue: []) @Default([]) List<T> results,
  }) = _ArrayResponse<T>;

  factory ArrayResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) => _$ArrayResponseFromJson(json, fromJsonT);
}
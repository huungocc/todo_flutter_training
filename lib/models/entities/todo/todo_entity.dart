import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_entity.freezed.dart';
part 'todo_entity.g.dart';

@freezed
abstract class TodoEntity with _$TodoEntity {
  const factory TodoEntity({
    @JsonKey(includeIfNull: false) String? id,
    @JsonKey(name: 'task_title') String? taskTitle,
    String? category,
    DateTime? date,
    String? time,
    String? notes,
    @Default(false) bool completed,
    @JsonKey(name: 'notification_id', includeIfNull: false) int? notificationId,
  }) = _TodoEntity;

  factory TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);
}

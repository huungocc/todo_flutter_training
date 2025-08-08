import 'package:json_annotation/json_annotation.dart';

part 'todo_entity.g.dart';

@JsonSerializable()
class TodoEntity {
  @JsonKey()
  String? id;

  @JsonKey(name: 'task_title')
  String? taskTitle;

  @JsonKey()
  String? category;

  @JsonKey(
    fromJson: _fromJsonDate,
    toJson: _toJsonDate,
  )
  DateTime? date;

  @JsonKey()
  String? time;

  @JsonKey()
  String? notes;

  @JsonKey()
  bool? completed;

  TodoEntity({
    this.id,
    this.taskTitle,
    this.category,
    this.date,
    this.time,
    this.notes,
    this.completed = false,
  });

  factory TodoEntity.fromJson(Map<String, dynamic> json) =>
      _$TodoEntityFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$TodoEntityToJson(this);
    json.removeWhere((key, value) => value == null);
    return json;
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  String get formattedDate => date?.toIso8601String() ?? '';

  static DateTime? _fromJsonDate(String? date) =>
      date == null ? null : DateTime.tryParse(date);

  static String? _toJsonDate(DateTime? date) =>
      date?.toIso8601String();
}

extension TodoEntityCopyWith on TodoEntity {
  TodoEntity copyWith({
    String? id,
    String? taskTitle,
    String? category,
    DateTime? date,
    String? time,
    String? notes,
    bool? completed,
  }) {
    return TodoEntity(
      id: id ?? this.id,
      taskTitle: taskTitle ?? this.taskTitle,
      category: category ?? this.category,
      date: date ?? this.date,
      time: time ?? this.time,
      notes: notes ?? this.notes,
      completed: completed ?? this.completed,
    );
  }
}


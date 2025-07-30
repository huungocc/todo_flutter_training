// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoEntity _$TodoEntityFromJson(Map<String, dynamic> json) => TodoEntity(
  id: json['id'] as String?,
  taskTitle: json['task_title'] as String?,
  category: json['category'] as String?,
  date: TodoEntity._fromJsonDate(json['date'] as String?),
  time: json['time'] as String?,
  notes: json['notes'] as String?,
  completed: json['completed'] as bool? ?? false,
);

Map<String, dynamic> _$TodoEntityToJson(TodoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_title': instance.taskTitle,
      'category': instance.category,
      'date': TodoEntity._toJsonDate(instance.date),
      'time': instance.time,
      'notes': instance.notes,
      'completed': instance.completed,
    };

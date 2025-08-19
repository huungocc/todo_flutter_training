import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';

part 'add_todo_state.freezed.dart';

@freezed
abstract class AddTodoState with _$AddTodoState {
  const factory AddTodoState({
    @Default(TodoEntity()) TodoEntity todo,
    String? successMessage,
    @Default(LoadStatus.initial) LoadStatus status,
    @Default(OperationStatus.none) OperationStatus operation,
    @Default(TodoItemType.list) TodoItemType selectedType,
  }) = _AddTodoState;
}

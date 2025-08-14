import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

part 'list_todo_state.freezed.dart';

@freezed
abstract class ListTodoState with _$ListTodoState {
  const factory ListTodoState({
    @Default(LoadStatus.initial) LoadStatus loadStatus,
    @Default([]) List<TodoEntity> activeTodos,
    @Default([]) List<TodoEntity> completedTodos,
    String? errorMessage,
  }) = _ListTodoState;
}

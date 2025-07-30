import 'package:equatable/equatable.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';

enum TodoStatus { initial, loading, loaded, error }

enum TodoOperation { none, add, update, delete, updateStatus }

class TodoState extends Equatable {
  const TodoState({
    this.status = TodoStatus.initial,
    this.todos = const [],
    this.completed = const [],
    this.errorMessage,
    this.successMessage,
    this.operation = TodoOperation.none,
  });

  final TodoStatus status;
  final List<TodoEntity> todos;
  final List<TodoEntity> completed;
  final String? errorMessage;
  final String? successMessage;
  final TodoOperation operation;

  // Getters State
  bool get isInitial => status == TodoStatus.initial;
  bool get isLoading => status == TodoStatus.loading;
  bool get isLoaded => status == TodoStatus.loaded;
  bool get isError => status == TodoStatus.error;
  bool get hasData => todos.isNotEmpty || completed.isNotEmpty;
  bool get hasSuccess => successMessage != null;

  TodoState copyWith({
    TodoStatus? status,
    List<TodoEntity>? todos,
    List<TodoEntity>? completed,
    String? errorMessage,
    String? successMessage,
    TodoOperation? operation,
  }) {
    return TodoState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      completed: completed ?? this.completed,
      errorMessage: errorMessage,
      successMessage: successMessage,
      operation: operation ?? this.operation,
    );
  }

  @override
  List<Object?> get props => [
    status,
    todos,
    completed,
    errorMessage,
    successMessage,
    operation,
  ];
}
import 'package:equatable/equatable.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';

class ListTodoState extends Equatable {
  const ListTodoState({
    this.loadStatus = LoadStatus.initial,
    this.activeTodos = const [],
    this.completedTodos = const [],
    this.errorMessage,
  });

  final LoadStatus loadStatus;
  final List<TodoEntity> activeTodos;
  final List<TodoEntity> completedTodos;
  final String? errorMessage;

  ListTodoState copyWith({
    LoadStatus? loadStatus,
    OperationStatus? operationStatus,
    List<TodoEntity>? activeTodos,
    List<TodoEntity>? completedTodos,
    String? errorMessage,
  }) {
    return ListTodoState(
      loadStatus: loadStatus ?? this.loadStatus,
      activeTodos: activeTodos ?? this.activeTodos,
      completedTodos: completedTodos ?? this.completedTodos,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    loadStatus,
    activeTodos,
    completedTodos,
    errorMessage,
  ];
}
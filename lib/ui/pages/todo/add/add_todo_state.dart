import 'package:equatable/equatable.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';

class AddTodoState extends Equatable {
  AddTodoState({
    TodoEntity? todo,
    this.status = LoadStatus.initial,
    this.errorMessage,
    this.successMessage,
    this.operation = OperationStatus.none,
  }) : todo = todo ?? TodoEntity();

  final TodoEntity todo;
  final LoadStatus status;
  final String? errorMessage;
  final String? successMessage;
  final OperationStatus operation;

  // Getters State
  bool get isInitial => status == LoadStatus.initial;
  bool get isLoading => status == LoadStatus.loading;
  bool get isLoaded => status == LoadStatus.success;
  bool get isError => status == LoadStatus.failure;
  bool get hasSuccess => successMessage != null;

  bool get isAdd => operation == OperationStatus.add;
  bool get isUpdate => operation == OperationStatus.update;
  bool get isDelete => operation == OperationStatus.delete;
  bool get isNone => operation == OperationStatus.none;

  AddTodoState copyWith({
    TodoEntity? todo,
    LoadStatus? status,
    String? errorMessage,
    String? successMessage,
    OperationStatus? operation,
  }) {
    return AddTodoState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
      errorMessage: errorMessage,
      successMessage: successMessage,
      operation: operation ?? this.operation,
    );
  }

  @override
  List<Object?> get props => [
    todo,
    status,
    errorMessage,
    successMessage,
    operation,
  ];
}

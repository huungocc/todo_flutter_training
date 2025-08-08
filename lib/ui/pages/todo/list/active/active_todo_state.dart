import 'package:equatable/equatable.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';

class ActiveTodoState extends Equatable {
  const ActiveTodoState({
    this.loadStatus = LoadStatus.initial,
    this.operationStatus = OperationStatus.none,
    this.activeTodos = const [],
    this.errorMessage,
  });

  final LoadStatus loadStatus;
  final OperationStatus operationStatus;
  final List<TodoEntity> activeTodos;
  final String? errorMessage;

  // Getters State
  bool get isInitial => loadStatus == LoadStatus.initial;
  bool get isLoading => loadStatus == LoadStatus.loading;
  bool get isLoaded => loadStatus == LoadStatus.success;
  bool get isError => loadStatus == LoadStatus.failure;
  bool get hasData => activeTodos.isNotEmpty;

  bool get isUpdateStatus => operationStatus == OperationStatus.updateStatus;
  bool get isDelete => operationStatus == OperationStatus.delete;
  bool get isAdd => operationStatus == OperationStatus.add;
  bool get isUpdate => operationStatus == OperationStatus.update;
  bool get isNone => operationStatus == OperationStatus.none;

  ActiveTodoState copyWith({
    LoadStatus? loadStatus,
    OperationStatus? operationStatus,
    List<TodoEntity>? todos,
    String? errorMessage,
  }) {
    return ActiveTodoState(
      loadStatus: loadStatus ?? this.loadStatus,
      operationStatus: operationStatus ?? this.operationStatus,
      activeTodos: todos ?? activeTodos,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    loadStatus,
    operationStatus,
    activeTodos,
    errorMessage,
  ];
}
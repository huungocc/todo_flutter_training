import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';

class AddTodoState extends Equatable {
  AddTodoState({
    TodoEntity? todo,
    this.status = LoadStatus.initial,
    this.errorMessage,
    this.successMessage,
    this.operation = OperationStatus.none,
    TextEditingController? taskTitleController,
    TextEditingController? timeController,
    TextEditingController? dateController,
    TextEditingController? notesController,
    this.selectedType = TodoItemType.list,
  })  : todo = todo ?? TodoEntity(),
        taskTitleController = taskTitleController ?? TextEditingController(),
        timeController = timeController ?? TextEditingController(),
        dateController = dateController ?? TextEditingController(),
        notesController = notesController ?? TextEditingController();

  final TodoEntity todo;
  final LoadStatus status;
  final String? errorMessage;
  final String? successMessage;
  final OperationStatus operation;
  final TextEditingController taskTitleController;
  final TextEditingController timeController;
  final TextEditingController dateController;
  final TextEditingController notesController;
  final TodoItemType selectedType;

  bool get hasSuccess => successMessage != null;

  AddTodoState copyWith({
    TodoEntity? todo,
    LoadStatus? status,
    String? errorMessage,
    String? successMessage,
    OperationStatus? operation,
    TextEditingController? taskTitleController,
    TextEditingController? timeController,
    TextEditingController? dateController,
    TextEditingController? notesController,
    TodoItemType? selectedType,
  }) {
    return AddTodoState(
      todo: todo ?? this.todo,
      status: status ?? this.status,
      errorMessage: errorMessage,
      successMessage: successMessage,
      operation: operation ?? this.operation,
      taskTitleController: taskTitleController ?? this.taskTitleController,
      timeController: timeController ?? this.timeController,
      dateController: dateController ?? this.dateController,
      notesController: notesController ?? this.notesController,
      selectedType: selectedType ?? this.selectedType,
    );
  }

  @override
  List<Object?> get props => [
    todo,
    status,
    errorMessage,
    successMessage,
    operation,
    taskTitleController,
    timeController,
    dateController,
    notesController,
    selectedType,
  ];

  void dispose() {
    taskTitleController.dispose();
    timeController.dispose();
    dateController.dispose();
    notesController.dispose();
  }
}

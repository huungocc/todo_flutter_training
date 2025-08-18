import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/common/app_picker.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';

@injectable
class AddTodoCubit extends Cubit<AddTodoState> {
  final TodoRepository todoRepository;

  AddTodoCubit({required this.todoRepository}) : super(const AddTodoState());

  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  Future<void> close() {
    taskTitleController.dispose();
    timeController.dispose();
    dateController.dispose();
    notesController.dispose();
    return super.close();
  }

  void setOperationStatus(OperationStatus status) {
    emit(state.copyWith(operation: status));
  }

  void setTodoEntity(TodoEntity entity) {
    final type = entity.category.toTodoItemType();

    emit(
      state.copyWith(
        todo: entity,
        operation: OperationStatus.update,
        selectedType: type,
      ),
    );

    // Khởi tạo dữ liệu cho controller (UI)
    taskTitleController.text = entity.taskTitle ?? '';
    dateController.text = entity.date != null
        ? entity.date!.formatDateToDDMMYYYY()
        : '';
    timeController.text = entity.time != null
        ? entity.time!.convertTime24to12()
        : '';
    notesController.text = entity.notes ?? '';
  }

  void updateCategory(TodoItemType type) {
    emit(state.copyWith(selectedType: type));
  }

  Future<void> pickDate(BuildContext context) async {
    final selectedDate = await AppPicker.pickDate(context: context);
    if (selectedDate != null) {
      dateController.text = selectedDate;
    }
  }

  Future<void> pickTime(BuildContext context) async {
    final selectedTime = await AppPicker.pickTime(context: context);
    if (selectedTime != null) {
      timeController.text = selectedTime;
    }
  }

  Future<void> addTodo() async {
    try {
      emit(state.copyWith(status: LoadStatus.loading));

      _updateEntityData();

      await todoRepository.addTodo(todo: state.todo);

      emit(
        state.copyWith(
          status: LoadStatus.success,
          successMessage: S.current.todo_add_success,
          operation: OperationStatus.add,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: LoadStatus.failure, errorMessage: e.toString()),
      );
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> updateTodo() async {
    try {
      emit(state.copyWith(status: LoadStatus.loading));
      _updateEntityData();

      await todoRepository.updateTodo(todo: state.todo);

      emit(
        state.copyWith(
          status: LoadStatus.success,
          successMessage: S.current.todo_update_success,
          operation: OperationStatus.update,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(status: LoadStatus.failure, errorMessage: e.toString()),
      );
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  void _updateEntityData() {
    final updatedTodo = state.todo.copyWith(
      taskTitle: taskTitleController.text,
      date: dateController.text.toDateFromDDMMYYYY(),
      time: timeController.text.convertTime12hTo24hWithSeconds(),
      notes: notesController.text,
      category: state.selectedType.name,
    );

    emit(state.copyWith(todo: updatedTodo));
  }
}

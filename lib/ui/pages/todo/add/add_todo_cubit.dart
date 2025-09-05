import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/common/app_picker.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/local_notification/local_notification_cubit.dart';
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

  final LocalNotificationCubit _localNotificationCubit;

  AddTodoCubit({
    required this.todoRepository,
    required LocalNotificationCubit localNotificationCubit,
  }) : _localNotificationCubit = localNotificationCubit,
       super(const AddTodoState());

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
      if (!_validateTodoData()) return;

      _updateEntityData();

      emit(state.copyWith(status: LoadStatus.loading));

      await todoRepository.addTodo(todo: state.todo);

      emit(
        state.copyWith(
          status: LoadStatus.success,
          successMessage: S.current.todo_add_success,
          operation: OperationStatus.add,
        ),
      );

      // Schedule Notification
      _localNotificationCubit.scheduleNotification(
        id: state.todo.notificationId!,
        title: state.todo.taskTitle!,
        body: state.todo.notes!,
        scheduledDateTime: state.todo.date!.withTime(state.todo.time!),
      );

      ExceptionHandler.showSuccessSnackBar(S.current.todo_add_success);
    } catch (e) {
      emit(state.copyWith(status: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> updateTodo() async {
    try {
      if (!_validateTodoData()) return;

      _updateEntityData();

      emit(state.copyWith(status: LoadStatus.loading));

      await todoRepository.updateTodo(todo: state.todo);

      emit(
        state.copyWith(
          status: LoadStatus.success,
          successMessage: S.current.todo_update_success,
          operation: OperationStatus.update,
        ),
      );

      // Schedule Notification
      _localNotificationCubit.scheduleNotification(
        id: state.todo.notificationId!,
        title: state.todo.taskTitle!,
        body: state.todo.notes!,
        scheduledDateTime: state.todo.date!.withTime(state.todo.time!),
      );

      ExceptionHandler.showSuccessSnackBar(S.current.todo_update_success);
    } catch (e) {
      emit(state.copyWith(status: LoadStatus.failure));
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
      notificationId: _localNotificationCubit.generateNotificationId(),
    );

    emit(state.copyWith(todo: updatedTodo));
  }

  bool _validateTodoData() {
    if (taskTitleController.text.isEmpty) {
      ExceptionHandler.showErrorSnackBar(S.current.todo_title_empty);
      return false;
    } else if (dateController.text.isEmpty) {
      ExceptionHandler.showErrorSnackBar(S.current.todo_date_empty);
      return false;
    } else if (timeController.text.isEmpty) {
      ExceptionHandler.showErrorSnackBar(S.current.todo_time_empty);
      return false;
    }
    return true;
  }
}

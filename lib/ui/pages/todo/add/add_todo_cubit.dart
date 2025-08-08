import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  final TodoRepository todoRepository;

  AddTodoCubit({
    required this.todoRepository,
  }) : super(AddTodoState());

  void setTodoEntity(TodoEntity entity) {
    emit(state.copyWith(todo: entity));
    if (entity.id == null) {
      emit(state.copyWith(operation: OperationStatus.add));
    } else {
      emit(state.copyWith(operation: OperationStatus.update));
    }
  }

  /// Add to Active List
  Future<void> addTodo() async {
    emit(state.copyWith(status: LoadStatus.loading));

    try {
      await todoRepository.addTodo(todo: state.todo);

      emit(
        state.copyWith(
          todo: state.todo,
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

  /// Update From Active List
  Future<void> updateTodo() async {
    emit(state.copyWith(status: LoadStatus.loading));

    try {
      await todoRepository.updateTodo(todo: state.todo);

      emit(
        state.copyWith(
          todo: state.todo,
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
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/completed/completed_todo_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

class CompletedTodoCubit extends Cubit<CompletedTodoState> {
  final TodoRepository todoRepository;

  CompletedTodoCubit({required this.todoRepository}) : super(const CompletedTodoState());

  Future<void> loadTodos() async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      final todos = await todoRepository.fetchTodos(completed: true);

      emit(state.copyWith(
        loadStatus: LoadStatus.success,
        todos: todos,
      ));
    } catch (e) {
      emit(state.copyWith(
        loadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      ));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  /// Update Status (Completed => Active)
  Future<void> updateTodoStatus(TodoEntity todo) async {
    emit(state.copyWith(loadStatus: LoadStatus.loading));

    try {
      await todoRepository.updateTodoStatus(
        id: todo.id!,
        completed: false,
      );

      emit(
        state.copyWith(
          loadStatus: LoadStatus.success,
          operationStatus: OperationStatus.updateStatus,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(loadStatus: LoadStatus.failure, errorMessage: e.toString()),
      );
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  /// Delete From Local & Server
  Future<void> deleteCompletedTodo(TodoEntity todo) async {
    try {
      // Delete on Local (optimistic update)
      _removeCompletedTodoFromLists(todo);

      // Delete on Server
      await todoRepository.deleteTodo(id: todo.id!);

      emit(
        state.copyWith(
          loadStatus: LoadStatus.success,
          operationStatus: OperationStatus.delete,
        ),
      );

      ExceptionHandler.showSuccessSnackBar(S.current.todo_delete_success);
    } catch (e) {
      // Get Todos when delete failed
      loadTodos();

      emit(
        state.copyWith(loadStatus: LoadStatus.failure, errorMessage: e.toString()),
      );
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  void _removeCompletedTodoFromLists(TodoEntity todoToRemove) {
    if (state.completedTodos.any((t) => t.id == todoToRemove.id) ==
        true) {
      final updatedActiveTodos = List<TodoEntity>.from(
        state.completedTodos,
      )..removeWhere((t) => t.id == todoToRemove.id);
      emit(
        state.copyWith(todos: updatedActiveTodos),
      );
    }
  }
}
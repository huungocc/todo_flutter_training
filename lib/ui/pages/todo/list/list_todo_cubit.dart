import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/list_todo_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

class ListTodoCubit extends Cubit<ListTodoState> {
  final TodoRepository todoRepository;

  ListTodoCubit({required this.todoRepository}) : super(const ListTodoState());

  Future<void> fetchTodos(TodoType todoType) async {
    try {
      emit(state.copyWith(loadStatus: LoadStatus.loading));

      if (todoType == TodoType.all) {
        await _fetchAllTodos();
      } else if (todoType == TodoType.active) {
        await _fetchActiveTodos();
      } else if (todoType == TodoType.completed) {
        await _fetchCompletedTodos();
      }
    } catch (e) {
      emit(state.copyWith(
        loadStatus: LoadStatus.failure,
        errorMessage: e.toString(),
      ));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> _fetchAllTodos() async {
    final todos = await todoRepository.fetchTodos();

    emit(state.copyWith(
      loadStatus: LoadStatus.success,
      activeTodos: _filterTodos(todos, false),
      completedTodos: _filterTodos(todos, true),
    ));
  }

  Future<void> _fetchActiveTodos() async {
    final todos = await todoRepository.fetchTodos(completed: false);

    emit(state.copyWith(
      loadStatus: LoadStatus.success,
      activeTodos: todos,
    ));
  }

  Future<void> _fetchCompletedTodos() async {
    final todos = await todoRepository.fetchTodos(completed: true);

    emit(state.copyWith(
      loadStatus: LoadStatus.success,
      completedTodos: todos,
    ));
  }

  /// Update Status (Active <=> Completed)
  Future<void> updateTodoStatus(TodoEntity todo) async {
    try {
      final newStatus = !(todo.completed ?? false);

      // Delete from Local (optimistic update)
      _moveTodoBetweenLists(todo, newStatus);

      // Delete from Server
      await todoRepository.updateTodoStatus(
        id: todo.id!,
        completed: newStatus,
      );

      emit(state.copyWith(
        loadStatus: LoadStatus.success,
      ));
    } catch (e) {
      // Reset Data when Error
      fetchTodos(TodoType.all);

      emit(
        state.copyWith(loadStatus: LoadStatus.failure, errorMessage: e.toString()),
      );

      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  /// Delete From Local & Server
  Future<void> deleteTodo(TodoEntity todo) async {
    try {
      // Delete from Local (optimistic update)
      _removeTodoFromLists(todo);

      // Delete from Server
      await todoRepository.deleteTodo(id: todo.id!);

      emit(
        state.copyWith(
          loadStatus: LoadStatus.success,
        ),
      );

      ExceptionHandler.showSuccessSnackBar(S.current.todo_delete_success);
    } catch (e) {
      // Reset Data when Error
      if (todo.completed == true) {
        fetchTodos(TodoType.completed);
      } else {
        fetchTodos(TodoType.active);
      }

      emit(
        state.copyWith(loadStatus: LoadStatus.failure, errorMessage: e.toString()),
      );

      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  void _removeTodoFromLists(TodoEntity todo) {
    final isCompleted = todo.completed ?? false;

    if (isCompleted) {
      final updatedCompleted = List<TodoEntity>.from(state.completedTodos)
        ..removeWhere((t) => t.id == todo.id);

      emit(state.copyWith(completedTodos: updatedCompleted));
    } else {
      final updatedActive = List<TodoEntity>.from(state.activeTodos)
        ..removeWhere((t) => t.id == todo.id);

      emit(state.copyWith(activeTodos: updatedActive));
    }
  }

  void _moveTodoBetweenLists(TodoEntity todo, bool newStatus) {
    final updatedActive = List<TodoEntity>.from(state.activeTodos)
      ..removeWhere((t) => t.id == todo.id);
    final updatedCompleted = List<TodoEntity>.from(state.completedTodos)
      ..removeWhere((t) => t.id == todo.id);

    if (newStatus) {
      updatedCompleted.add(todo.copyWith(completed: true));
    } else {
      updatedActive.add(todo.copyWith(completed: false));
    }

    emit(state.copyWith(
      activeTodos: updatedActive,
      completedTodos: updatedCompleted,
    ));
  }

  List<TodoEntity> _filterTodos(List<TodoEntity> todos, bool completed) {
    return todos.where((t) => t.completed == completed).toList();
  }
}

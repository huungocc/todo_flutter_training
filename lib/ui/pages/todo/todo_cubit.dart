import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/todo_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository todoRepository;

  TodoCubit({required this.todoRepository}) : super(const TodoState());

  Future<void> loadTodos({required bool isCompleted}) async {
    emit(state.copyWith(status: TodoStatus.loading));

    try {
      final todos = await todoRepository.fetchTodos(completed: isCompleted);

      emit(
        isCompleted
            ? state.copyWith(status: TodoStatus.loaded, completed: todos)
            : state.copyWith(status: TodoStatus.loaded, todos: todos),
      );
    } catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
        errorMessage: e.toString(),
      ));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> addTodo(TodoEntity todo) async {
    emit(state.copyWith(status: TodoStatus.loading));

    try {
      await todoRepository.addTodo(todo: todo);

      await _reloadData();

      emit(state.copyWith(
        status: TodoStatus.loaded,
        successMessage: S.current.todo_add_success,
        operation: TodoOperation.add,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
        errorMessage: e.toString(),
      ));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> updateTodo(TodoEntity todo) async {
    emit(state.copyWith(status: TodoStatus.loading));

    try {
      await todoRepository.updateTodo(todo: todo);

      await _reloadData();

      emit(state.copyWith(
        status: TodoStatus.loaded,
        successMessage: S.current.todo_update_success,
        operation: TodoOperation.update,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
        errorMessage: e.toString(),
      ));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> updateTodoStatus(TodoEntity todo, bool completed) async {
    emit(state.copyWith(status: TodoStatus.loading));

    try {
      await todoRepository.updateTodoStatus(id: todo.id!, completed: completed);

      await _reloadData();

      emit(state.copyWith(
        status: TodoStatus.loaded,
        successMessage: S.current.todo_update_status_success,
        operation: TodoOperation.updateStatus,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
        errorMessage: e.toString(),
      ));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> deleteTodo(TodoEntity todo) async {
    try {
      await todoRepository.deleteTodo(id: todo.id!);

      final updatedTodos = List<TodoEntity>.from(state.todos)
        ..removeWhere((t) => t.id == todo.id);
      final updatedCompleted = List<TodoEntity>.from(state.completed)
        ..removeWhere((t) => t.id == todo.id);

      emit(state.copyWith(
        todos: updatedTodos,
        completed: updatedCompleted,
        successMessage: S.current.todo_delete_success,
        operation: TodoOperation.delete,
      ));

      ExceptionHandler.showSuccessSnackBar(S.current.todo_delete_success);
    } catch (e) {
      emit(state.copyWith(
        status: TodoStatus.error,
        errorMessage: e.toString(),
      ));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> _reloadData() async {
    final todos = await todoRepository.fetchTodos(completed: false);
    final completed = await todoRepository.fetchTodos(completed: true);

    emit(state.copyWith(
      todos: todos,
      completed: completed,
    ));
  }
}
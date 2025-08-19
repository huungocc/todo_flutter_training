import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/local_notification/local_notification_cubit.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/list_todo_state.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';

@injectable
class ListTodoCubit extends Cubit<ListTodoState> {
  final TodoRepository todoRepository;

  final LocalNotificationCubit _localNotificationCubit;

  ListTodoCubit({
    required this.todoRepository,
    required LocalNotificationCubit localNotificationCubit,
  }) : _localNotificationCubit = localNotificationCubit,
       super(const ListTodoState());

  Future<void> fetchTodos(TodoType todoType) async {
    if (todoType == TodoType.all) {
      await _fetchAllTodos();
    } else if (todoType == TodoType.active) {
      await _fetchActiveTodos();
    } else if (todoType == TodoType.completed) {
      await _fetchCompletedTodos();
    }
  }

  Future<void> _fetchAllTodos() async {
    try {
      emit(
        state.copyWith(
          activeLoadStatus: LoadStatus.loading,
          completedLoadStatus: LoadStatus.loading,
        ),
      );

      final todos = await todoRepository.fetchTodos();

      emit(
        state.copyWith(
          activeLoadStatus: LoadStatus.success,
          completedLoadStatus: LoadStatus.success,
          activeTodos: _filterTodos(todos, false),
          completedTodos: _filterTodos(todos, true),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          activeLoadStatus: LoadStatus.failure,
          completedLoadStatus: LoadStatus.failure,
        ),
      );
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> _fetchActiveTodos() async {
    try {
      emit(state.copyWith(activeLoadStatus: LoadStatus.loading));

      final todos = await todoRepository.fetchTodos(completed: false);

      emit(
        state.copyWith(
          activeLoadStatus: LoadStatus.success,
          activeTodos: todos,
        ),
      );
    } catch (e) {
      emit(state.copyWith(activeLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  Future<void> _fetchCompletedTodos() async {
    try {
      emit(state.copyWith(completedLoadStatus: LoadStatus.loading));

      final todos = await todoRepository.fetchTodos(completed: true);

      emit(
        state.copyWith(
          completedLoadStatus: LoadStatus.success,
          completedTodos: todos,
        ),
      );
    } catch (e) {
      emit(state.copyWith(completedLoadStatus: LoadStatus.failure));
      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  /// Update Status (Active <=> Completed)
  Future<void> updateTodoStatus(TodoEntity todo) async {
    try {
      final newStatus = !todo.completed;

      // Delete from Local (optimistic update)
      _moveTodoBetweenLists(todo, newStatus);

      // Delete from Server
      await todoRepository.updateTodoStatus(id: todo.id!, completed: newStatus);

      emit(
        state.copyWith(
          activeLoadStatus: LoadStatus.success,
          completedLoadStatus: LoadStatus.success,
        ),
      );

      if (newStatus) {
        _localNotificationCubit.cancelNotification(todo.notificationId!);
      } else {
        _localNotificationCubit.scheduleNotification(
          id: todo.notificationId!,
          title: todo.taskTitle!,
          body: todo.notes!,
          scheduledDateTime: todo.date!.withTime(todo.time!),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          activeLoadStatus: LoadStatus.failure,
          completedLoadStatus: LoadStatus.failure,
        ),
      );

      // Reset Data when Error
      fetchTodos(TodoType.all);

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

      if (todo.completed == true) {
        emit(state.copyWith(completedLoadStatus: LoadStatus.success));
      } else {
        emit(state.copyWith(activeLoadStatus: LoadStatus.success));
      }

      // Cancel Notification
      _localNotificationCubit.cancelNotification(todo.notificationId!);

      ExceptionHandler.showSuccessSnackBar(S.current.todo_delete_success);
    } catch (e) {
      if (todo.completed == true) {
        emit(state.copyWith(completedLoadStatus: LoadStatus.failure));
      } else {
        emit(state.copyWith(activeLoadStatus: LoadStatus.failure));
      }

      // Reset Data when Error
      if (todo.completed == true) {
        fetchTodos(TodoType.completed);
      } else {
        fetchTodos(TodoType.active);
      }

      ExceptionHandler.showErrorSnackBar('$e');
    }
  }

  void _removeTodoFromLists(TodoEntity todo) {
    final isCompleted = todo.completed;

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

    emit(
      state.copyWith(
        activeTodos: updatedActive,
        completedTodos: updatedCompleted,
      ),
    );
  }

  List<TodoEntity> _filterTodos(List<TodoEntity> todos, bool completed) {
    return todos.where((t) => t.completed == completed).toList();
  }
}

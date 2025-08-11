import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/network/api_client.dart';

abstract class TodoRepository {
  Future<void> addTodo({required TodoEntity todo});

  Future<List<TodoEntity>> fetchTodos({bool? completed});

  Future<void> updateTodo({required TodoEntity todo});

  Future<void> updateTodoStatus({required String id, required bool completed});

  Future<void> deleteTodo({required String id});
}

class TodoRepositoryImpl implements TodoRepository {
  final ApiClient apiClient;

  TodoRepositoryImpl({required this.apiClient});

  @override
  Future<void> addTodo({required TodoEntity todo}) async {
    return apiClient.addTodo(todo: todo);
  }

  @override
  Future<List<TodoEntity>> fetchTodos({bool? completed}) async {
    return apiClient.fetchTodos(completed: completed);
  }

  @override
  Future<void> updateTodo({required TodoEntity todo}) async {
    return apiClient.updateTodo(todo: todo);
  }

  @override
  Future<void> updateTodoStatus({required String id, required bool completed}) async {
    return apiClient.updateTodoStatus(id: id, completed: completed);
  }

  @override
  Future<void> deleteTodo({required String id}) async {
    return apiClient.deleteTodo(id: id);
  }
}

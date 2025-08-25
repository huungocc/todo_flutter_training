import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/network/api_interceptors.dart';

class ApiClient {
  final SupabaseClient _client;

  ApiClient(this._client);

  /// ================== AUTH ==================

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    return ApiInterceptors.executeWithLogging('SIGN_IN', () async {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        throw Exception('Đăng nhập thất bại');
      }
    });
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    return ApiInterceptors.executeWithLogging('SIGN_UP', () async {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: AppConfigs.emailRedirectLink
      );

      if (response.user == null) {
        throw Exception('Đăng ký thất bại');
      }
    });
  }

  Future<void> signOut() async {
    return ApiInterceptors.executeWithLogging('SIGN_OUT', () async {
      await _client.auth.signOut();
    });
  }

  /// ================== TODOS ==================

  Future<void> addTodo({required TodoEntity todo}) async {
    return ApiInterceptors.executeWithLogging('ADD_TODO', () async {
      final data = todo.toJson();
      await _client.from('todos').insert(data);
    });
  }

  Future<List<TodoEntity>> fetchTodos({bool? completed}) async {
    return ApiInterceptors.executeWithLogging('GET_TODOS', () async {
      var query = _client.from('todos').select();

      if (completed != null) {
        query = query.eq('completed', completed);
      }

      final response = await query.order('created_at', ascending: false);

      return (response as List)
          .map((json) => TodoEntity.fromJson(json))
          .toList();
    });
  }

  Future<void> updateTodo({required TodoEntity todo}) async {
    if (todo.id == null) {
      throw ArgumentError('Todo ID không được null');
    }

    return ApiInterceptors.executeWithLogging('UPDATE_TODO', () async {
      final updateData = todo.toJson();

      await _client
          .from('todos')
          .update(updateData)
          .eq('id', todo.id as Object);
    });
  }

  Future<void> updateTodoStatus({
    required String id,
    required bool completed,
  }) async {
    return ApiInterceptors.executeWithLogging('UPDATE_TODO_STATUS', () async {
      await _client.from('todos').update({'completed': completed}).eq('id', id);
    });
  }

  Future<void> deleteTodo({required String id}) async {
    return ApiInterceptors.executeWithLogging('DELETE_TODO', () async {
      await _client.from('todos').delete().eq('id', id);
    });
  }
}

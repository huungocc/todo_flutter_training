import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/models/entities/auth/auth_entity.dart';
import 'package:todo_flutter_training/models/entities/session/session_entity.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/database/share_preferences_helper.dart';
import 'package:todo_flutter_training/models/entities/user/user_entity.dart';
import 'package:todo_flutter_training/network/api_interceptors.dart';
import 'package:todo_flutter_training/utils/device_info_util.dart';

class ApiClient {
  final SupabaseClient _client;

  ApiClient(this._client);

  // Lấy device ID
  Future<String> _getDeviceId() async {
    var deviceUDID = await SharedPreferencesHelper.getDeviceUDID();
    if (deviceUDID != null) return deviceUDID;

    deviceUDID = await DeviceInfoUtil.getDeviceId();
    await SharedPreferencesHelper.saveDeviceUDID(deviceUDID);
    return deviceUDID;
  }

  /// ================== AUTH ==================

  Future<AuthEntity> signIn({
    required String email,
    required String password,
  }) async {
    return ApiInterceptors.executeWithLogging('SIGN_IN', () async {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = response.user;
      final session = response.session;

      if (user == null || session == null) {
        throw Exception('Đăng nhập thất bại');
      }

      return AuthEntity(
        user: UserEntity.fromJson(user.toJson()),
        session: SessionEntity.fromJson({
          ...session.toJson(),
        }),
      );
    });
  }

  Future<AuthEntity> signUp({
    required String email,
    required String password,
  }) async {
    return ApiInterceptors.executeWithLogging('SIGN_UP', () async {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );

      final user = response.user;
      final session = response.session;

      if (user == null || session == null) {
        throw Exception('Đăng ký thất bại');
      }

      return AuthEntity(
        user: UserEntity.fromJson(user.toJson()),
        session: SessionEntity.fromJson({
          ...session.toJson(),
        }),
      );
    });
  }

  Future<void> signOut() async {
    return ApiInterceptors.executeWithLogging('SIGN_OUT', () async {
      await _client.auth.signOut();
    });
  }

  Future<AuthEntity?> getCurrentUser() async {
    final user = _client.auth.currentUser;
    final session = _client.auth.currentSession;

    if (user == null || session == null) return null;

    return AuthEntity(
      user: UserEntity.fromJson(user.toJson()),
      session: SessionEntity.fromJson({
        ...session.toJson(),
      }),
    );
  }

  /// ================== TODOS ==================

  Future<void> addTodo({required TodoEntity todo}) async {
    return ApiInterceptors.executeWithLogging('ADD_TODO', () async {
      final deviceId = await _getDeviceId();

      final data = todo.toJson();
      data['device_id'] = deviceId;

      await _client.from('todos').insert(data);
    });
  }

  Future<List<TodoEntity>> fetchTodos({bool? completed}) async {
    return ApiInterceptors.executeWithLogging('GET_TODOS', () async {
      final deviceId = await _getDeviceId();

      var query = _client.from('todos').select().eq('device_id', deviceId);

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

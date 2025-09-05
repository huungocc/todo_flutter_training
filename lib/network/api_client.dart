import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/entities/user_info/user_info_entity.dart';
import 'package:todo_flutter_training/network/api_interceptors.dart';

class ApiClient {
  final SupabaseClient _client;

  ApiClient(this._client);

  // ================== AUTH ==================

  Future<Session?> signIn({
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
      return response.session;
    });
  }

  Future<Session?> signUp({
    required String email,
    required String password,
  }) async {
    return ApiInterceptors.executeWithLogging('SIGN_UP', () async {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        emailRedirectTo: AppConfigs.emailRedirectLink,
      );
      if (response.user == null) {
        throw Exception('Đăng ký thất bại');
      }
      return response.session;
    });
  }

  Future<void> signOut() async {
    return ApiInterceptors.executeWithLogging('SIGN_OUT', () async {
      await _client.auth.signOut();
    });
  }

  Session? getSession() => _client.auth.currentSession;

  Stream<AuthState> listenAuthState() => _client.auth.onAuthStateChange;

  Future<void> getSessionFromUrl(Uri uri) =>
      _client.auth.getSessionFromUrl(uri);

  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return ApiInterceptors.executeWithLogging('UPDATE_PASSWORD', () async {
      final user = _client.auth.currentUser;
      if (user == null || user.email == null) {
        throw Exception('Người dùng chưa đăng nhập');
      }

      // Re-authenticate
      final signInResponse = await _client.auth.signInWithPassword(
        email: user.email!,
        password: oldPassword,
      );

      if (signInResponse.user == null) {
        throw Exception('Mật khẩu cũ không đúng');
      }

      // Update new password
      await _client.auth.updateUser(UserAttributes(password: newPassword));
    });
  }

  Future<String?> uploadAvatar(XFile file) async {
    return ApiInterceptors.executeWithLogging('UPLOAD_AVATAR', () async {
      final userId = _client.auth.currentUser!.id;
      final filePath = userId;

      final uploadFile = File(file.path);

      // Upload file, ghi đè
      await _client.storage.from('avatars').upload(
        filePath,
        uploadFile,
        fileOptions: const FileOptions(upsert: true),
      );

      // Lấy public URL
      final publicUrl = _client.storage.from('avatars').getPublicUrl(filePath);

      // Thêm timestamp query để cache refresh
      final versionedUrl = '$publicUrl?v=${DateTime.now().millisecondsSinceEpoch}';

      return versionedUrl;
    });
  }


  Future<void> updateUserInfo(UserInfoEntity entity) async {
    return ApiInterceptors.executeWithLogging('UPDATE_USER_INFO', () async {
      await _client.from('user_info').upsert({
        if (entity.userName != null) 'user_name': entity.userName,
        if (entity.avatarUrl != null) 'avatar_url': entity.avatarUrl,
      });
    });
  }

  Future<UserInfoEntity?> getUserInfo() async {
    return ApiInterceptors.executeWithLogging('GET_USER_INFO', () async {
      final data = await _client
          .from('user_info')
          .select()
          .maybeSingle();

      return data != null
          ? UserInfoEntity.fromJson(Map<String, dynamic>.from(data))
          : null;
    });
  }

  // ================== TODOS ==================

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

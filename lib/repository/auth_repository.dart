import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/models/entities/auth/auth_user_entity.dart';
import 'package:todo_flutter_training/models/entities/user_info/user_info_entity.dart';
import 'package:todo_flutter_training/network/api_client.dart';

abstract class AuthRepository {
  Future<Session?> signIn({required String email, required String password});

  Future<Session?> signUp({required String email, required String password});

  Future<void> signOut();

  AuthUserEntity? getCurrentUser();

  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  });

  Future<UserInfoEntity?> getUserInfo();

  Future<String?> uploadUserAvatar(XFile file);

  Future<void> updateUserInfo(UserInfoEntity entity);
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<Session?> signIn({
    required String email,
    required String password,
  }) async {
    return _apiClient.signIn(email: email, password: password);
  }

  @override
  Future<Session?> signUp({
    required String email,
    required String password,
  }) async {
    return _apiClient.signUp(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    return _apiClient.signOut();
  }

  @override
  AuthUserEntity? getCurrentUser() {
    final session = _apiClient.getSession();
    final user = session?.user;

    if (user == null) return null;

    return AuthUserEntity(
      id: user.id,
      email: user.email,
      isConfirmed: session != null,
    );
  }

  @override
  Future<void> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    return _apiClient.updatePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  @override
  Future<UserInfoEntity?> getUserInfo() {
    return _apiClient.getUserInfo();
  }

  @override
  Future<String?> uploadUserAvatar(XFile file) {
    return _apiClient.uploadAvatar(file);
  }

  @override
  Future<void> updateUserInfo(UserInfoEntity entity) {
    return _apiClient.updateUserInfo(entity);
  }


}

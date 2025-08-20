import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/models/entities/auth/auth_entity.dart';
import 'package:todo_flutter_training/network/api_client.dart';

abstract class AuthRepository {
  Future<AuthEntity> signIn({
    required String email,
    required String password,
  });

  Future<AuthEntity> signUp({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<AuthEntity?> getCurrentUser();
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<AuthEntity> signIn({
    required String email,
    required String password,
  }) async {
    return _apiClient.signIn(email: email, password: password);
  }

  @override
  Future<AuthEntity> signUp({
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
  Future<AuthEntity?> getCurrentUser() async {
    return _apiClient.getCurrentUser();
  }
}
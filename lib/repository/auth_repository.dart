import 'package:injectable/injectable.dart';
import 'package:todo_flutter_training/network/api_client.dart';

abstract class AuthRepository {
  Future<void> signIn({required String email, required String password});

  Future<void> signUp({required String email, required String password});

  Future<void> signOut();
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<void> signIn({required String email, required String password}) async {
    return _apiClient.signIn(email: email, password: password);
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    return _apiClient.signUp(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    return _apiClient.signOut();
  }
}

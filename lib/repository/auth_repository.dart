import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/models/entities/auth/auth_user_entity.dart';
import 'package:todo_flutter_training/models/enums/auth_type.dart';
import 'package:todo_flutter_training/network/api_client.dart';

abstract class AuthRepository {
  Future<Session?> signIn({required String email, required String password});

  Future<Session?> signUp({required String email, required String password});

  Future<void> signOut();

  AuthUserEntity? getCurrentUser();

  Stream<AuthStatus> authStatusStream();

  Future<void> handleDeepLink(Uri uri);
}

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final ApiClient _apiClient;

  AuthRepositoryImpl(this._apiClient);

  @override
  Future<Session?> signIn({required String email, required String password}) async {
    return _apiClient.signIn(email: email, password: password);
  }

  @override
  Future<Session?> signUp({required String email, required String password}) async {
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
  Stream<AuthStatus> authStatusStream() {
    return _apiClient.listenAuthState().map((supabaseState) {
      switch (supabaseState.event) {
        case AuthChangeEvent.signedIn:
          return AuthStatus.signedIn;
        case AuthChangeEvent.signedOut:
          return AuthStatus.signedOut;
        default:
          return AuthStatus.unknown;
      }
    });
  }

  @override
  Future<void> handleDeepLink(Uri uri) => _apiClient.getSessionFromUrl(uri);
}

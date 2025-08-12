import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';
import 'package:todo_flutter_training/utils/logger.dart';

class ApiInterceptors {
  static Future<T> executeWithLogging<T>(
    String operation,
    Future<T> Function() function,
  ) async {
    try {
      logger.i('🔄 SUPABASE[$operation] => STARTING');

      final result = await function();

      logger.i('✅ SUPABASE[$operation] => SUCCESS');
      return result;
    } catch (error, stackTrace) {
      logger.e(
        '⚠️ SUPABASE[$operation] => ERROR: $error',
        stackTrace: stackTrace,
      );

      final errorMessage = _handleSupabaseError(error);
      ExceptionHandler.showErrorSnackBar(errorMessage);

      rethrow;
    }
  }

  static String _handleSupabaseError(dynamic error) {
    if (error is PostgrestException) {
      switch (error.code) {
        case '23505':
          return S.current.error_duplicate_data;
        case '23503':
          return S.current.error_foreign_key_violation;
        default:
          return error.message;
      }
    } else if (error is AuthException) {
      return S.current.error_authentication(error.message);
    } else {
      return S.current.error_connection(error.toString());
    }
  }
}

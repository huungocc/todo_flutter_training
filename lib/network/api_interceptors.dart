import 'package:supabase_flutter/supabase_flutter.dart';
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
      logger.e('⚠️ SUPABASE[$operation] => ERROR: $error', stackTrace: stackTrace);

      final errorMessage = _handleSupabaseError(error);
      ExceptionHandler.showErrorSnackBar(errorMessage);

      rethrow;
    }
  }

  static String _handleSupabaseError(dynamic error) {
    if (error is PostgrestException) {
      switch (error.code) {
        case '23505':
          return 'Dữ liệu đã tồn tại';
        case '23503':
          return 'Vi phạm ràng buộc dữ liệu';
        default:
          return error.message;
      }
    } else if (error is AuthException) {
      return 'Lỗi xác thực: ${error.message}';
    } else {
      return 'Lỗi kết nối: ${error.toString()}';
    }
  }
}
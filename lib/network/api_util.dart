import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';

class ApiUtil {
  static SupabaseClient? _client;

  static Future<void> initialize() async {
    if (_client == null) {
      await Supabase.initialize(
        url: SupabaseAPIConfig.supabaseUrl,
        anonKey: SupabaseAPIConfig.supabaseAnonKey,
      );

      _client = Supabase.instance.client;

    }
  }

  static SupabaseClient get client {
    if (_client == null) {
      throw Exception('Supabase chưa được khởi tạo. Gọi SupabaseUtil.initialize() trước.');
    }
    return _client!;
  }
}
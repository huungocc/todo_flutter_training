import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/network/api_client.dart';

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

  static ApiClient get apiClient {
    return ApiClient(client);
  }

  static SupabaseClient get client {
    if (_client == null) {
      throw Exception(
        S.current.supabase_not_initialized,
      );
    }
    return _client!;
  }
}

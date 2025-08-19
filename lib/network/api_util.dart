import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/network/api_client.dart';

@module
abstract class ApiUtil {
  @preResolve
  @lazySingleton
  Future<SupabaseClient> initialize() async {
    await Supabase.initialize(
      url: SupabaseAPIConfig.supabaseUrl,
      anonKey: SupabaseAPIConfig.supabaseAnonKey,
    );
    return Supabase.instance.client;
  }

  @lazySingleton
  ApiClient provideApiClient(SupabaseClient client) => ApiClient(client);
}

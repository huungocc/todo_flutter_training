import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/network/api_client.dart';
import 'package:todo_flutter_training/utils/deep_link_service.dart';

@module
abstract class ApiUtil {
  @preResolve
  @lazySingleton
  Future<SupabaseClient> provideSupabaseClient() async {
    await Supabase.initialize(
      url: SupabaseAPIConfig.supabaseUrl,
      anonKey: SupabaseAPIConfig.supabaseAnonKey,
      authOptions: const FlutterAuthClientOptions(
        autoRefreshToken: true,
        detectSessionInUri: true,
      ),
    );
    return Supabase.instance.client;
  }

  @lazySingleton
  ApiClient provideApiClient(SupabaseClient client) => ApiClient(client);

  @preResolve
  @lazySingleton
  Future<DeepLinkService> provideDeepLinkService() async {
    final service = DeepLinkService();
    await service.init();
    return service;
  }
}

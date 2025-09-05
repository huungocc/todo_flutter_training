// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:todo_flutter_training/global_blocs/local_notification/local_notification_cubit.dart'
    as _i626;
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart'
    as _i112;
import 'package:todo_flutter_training/global_blocs/user_info/user_info_cubit.dart'
    as _i1028;
import 'package:todo_flutter_training/network/api_client.dart' as _i700;
import 'package:todo_flutter_training/network/api_util.dart' as _i924;
import 'package:todo_flutter_training/repository/auth_repository.dart' as _i45;
import 'package:todo_flutter_training/repository/local_notification_repository.dart'
    as _i728;
import 'package:todo_flutter_training/repository/todo_repository.dart'
    as _i1020;
import 'package:todo_flutter_training/ui/pages/auth/auth_cubit.dart' as _i591;
import 'package:todo_flutter_training/ui/pages/auth/login/login_cubit.dart'
    as _i534;
import 'package:todo_flutter_training/ui/pages/auth/register/register_cubit.dart'
    as _i861;
import 'package:todo_flutter_training/ui/pages/change_user_info/change_user_info_cubit.dart'
    as _i85;
import 'package:todo_flutter_training/ui/pages/setting/setting_cubit.dart'
    as _i940;
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_cubit.dart'
    as _i356;
import 'package:todo_flutter_training/ui/pages/todo/list/list_todo_cubit.dart'
    as _i833;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final apiUtil = _$ApiUtil();
    gh.factory<_i591.AuthCubit>(() => _i591.AuthCubit());
    gh.factory<_i112.AppSettingCubit>(() => _i112.AppSettingCubit());
    await gh.lazySingletonAsync<_i454.SupabaseClient>(
      () => apiUtil.initialize(),
      preResolve: true,
    );
    gh.factory<_i728.LocalNotificationRepository>(
      () => _i728.LocalNotificationRepositoryImpl(),
    );
    gh.lazySingleton<_i700.ApiClient>(
      () => apiUtil.provideApiClient(gh<_i454.SupabaseClient>()),
    );
    gh.factory<_i45.AuthRepository>(
      () => _i45.AuthRepositoryImpl(gh<_i700.ApiClient>()),
    );
    gh.factory<_i861.RegisterCubit>(
      () => _i861.RegisterCubit(authRepository: gh<_i45.AuthRepository>()),
    );
    gh.factory<_i534.LoginCubit>(
      () => _i534.LoginCubit(authRepository: gh<_i45.AuthRepository>()),
    );
    gh.factory<_i940.SettingCubit>(
      () => _i940.SettingCubit(authRepository: gh<_i45.AuthRepository>()),
    );
    gh.factory<_i1028.UserInfoCubit>(
      () => _i1028.UserInfoCubit(authRepository: gh<_i45.AuthRepository>()),
    );
    gh.factory<_i85.ChangeUserInfoCubit>(
      () => _i85.ChangeUserInfoCubit(authRepository: gh<_i45.AuthRepository>()),
    );
    gh.factory<_i1020.TodoRepository>(
      () => _i1020.TodoRepositoryImpl(apiClient: gh<_i700.ApiClient>()),
    );
    gh.factory<_i626.LocalNotificationCubit>(
      () =>
          _i626.LocalNotificationCubit(gh<_i728.LocalNotificationRepository>()),
    );
    gh.factory<_i356.AddTodoCubit>(
      () => _i356.AddTodoCubit(
        todoRepository: gh<_i1020.TodoRepository>(),
        localNotificationCubit: gh<_i626.LocalNotificationCubit>(),
      ),
    );
    gh.factory<_i833.ListTodoCubit>(
      () => _i833.ListTodoCubit(
        todoRepository: gh<_i1020.TodoRepository>(),
        localNotificationCubit: gh<_i626.LocalNotificationCubit>(),
      ),
    );
    return this;
  }
}

class _$ApiUtil extends _i924.ApiUtil {}

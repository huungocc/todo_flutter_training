import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/local_notification/local_notification_cubit.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/global_blocs/user_info/user_info_cubit.dart';
import 'package:todo_flutter_training/models/enums/app_theme_mode.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:todo_flutter_training/router/router_config.dart';
import 'package:todo_flutter_training/theme/app_theme_data.dart';
import 'package:todo_flutter_training/utils/injection.dart';

import 'theme/app_theme_interface.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.instance().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppSettingCubit>(create: (_) => getIt<AppSettingCubit>()),
        BlocProvider<LocalNotificationCubit>(
          create: (_) => getIt<LocalNotificationCubit>(),
        ),
        BlocProvider<UserInfoCubit>(create: (_) => getIt<UserInfoCubit>()),
      ],
      child: _buildApp(),
    );
  }

  Widget _buildApp() {
    return BlocBuilder<AppSettingCubit, AppSettingState>(
      buildWhen: (prev, current) {
        return prev.language != current.language ||
            prev.themeMode != current.themeMode;
      },
      builder: (context, state) {
        final themeMode = state.themeMode;
        final themeData = themeMode.themeData(
          darkTheme: getIt<DarkThemeData>(),
          lightTheme: getIt<LightThemeData>(),
        );
        return GestureDetector(
          onTap: () {
            _hideKeyboard(context);
          },
          child: _buildMaterialApp(
            locale: state.language.local,
            themeMode: themeMode,
            themeData: themeData,
          ),
        );
      },
    );
  }

  Widget _buildMaterialApp({
    required Locale locale,
    required AppThemeMode themeMode,
    required AppThemeData themeData,
  }) {
    return MaterialApp.router(
      title: AppConfigs.appName,
      themeMode: themeMode.flutterThemeMode,
      theme: themeData.themeData,
      routerConfig: AppRouter.router,
      locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

  void _hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

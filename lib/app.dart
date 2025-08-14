import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/notification/notification_cubit.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:todo_flutter_training/network/api_client.dart';
import 'package:todo_flutter_training/network/api_util.dart';
import 'package:todo_flutter_training/repository/notification_repository.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/router/router_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late ApiClient _apiClient;
  late FirebaseMessaging _messaging;

  @override
  void initState() {
    _apiClient = ApiUtil.apiClient;
    _messaging = FirebaseMessaging.instance;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenSize.instance().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<TodoRepository>(
          create: (context) {
            return TodoRepositoryImpl(apiClient: _apiClient);
          },
        ),
        RepositoryProvider<NotificationRepository>(
          create: (context) {
            return NotificationRepositoryImpl(_messaging);
          },
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => AppSettingCubit()..getInitialSetting()),
          BlocProvider(
            create: (_) =>
                NotificationCubit(context.read<NotificationRepository>())
                  ..initialize(),
          ),
        ],
        child: BlocBuilder<AppSettingCubit, AppSettingState>(
          buildWhen: (prev, current) {
            return prev.language != current.language;
          },
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                _hideKeyboard(context);
              },
              child: _buildMaterialApp(locale: state.language.local),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMaterialApp({required Locale locale}) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: AppConfigs.appName,
      themeMode: ThemeMode.dark,
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

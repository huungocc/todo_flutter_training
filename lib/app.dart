import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/local_notification/local_notification_cubit.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:todo_flutter_training/router/router_config.dart';
import 'package:todo_flutter_training/utils/injection.dart';

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
        BlocProvider<AppSettingCubit>(
          create: (_) => getIt<AppSettingCubit>()..getInitialSetting(),
        ),
        BlocProvider<LocalNotificationCubit>(
          create: (_) => getIt<LocalNotificationCubit>(),
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

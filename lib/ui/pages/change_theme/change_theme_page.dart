import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/enums/app_theme_mode.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';

class ChangeThemePage extends StatelessWidget {
  const ChangeThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ChangeThemeBody();
  }
}

class _ChangeThemeBody extends StatefulWidget {
  const _ChangeThemeBody();

  @override
  State<_ChangeThemeBody> createState() => _ChangeThemeBodyState();
}

class _ChangeThemeBodyState extends State<_ChangeThemeBody> {
  final _themeModeList = [
    AppThemeMode.system,
    AppThemeMode.light,
    AppThemeMode.dark,
  ];

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      title: S.of(context).change_theme,
      isLightStatusBar: true,
      body: BlocBuilder<AppSettingCubit, AppSettingState>(
        buildWhen: (prev, current) => prev.themeMode != current.themeMode,
        builder: (context, state) {
          return RadioGroup(
            groupValue: state.themeMode,
            onChanged: (value) {
              if (value != null) {
                context.read<AppSettingCubit>().changeThemeMode(value);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: _themeModeList.asMap().entries.map((entry) {
                  final themeMode = entry.value;

                  return BaseButton(
                    backgroundColor: themeMode == state.themeMode
                        ? context.colors.primary
                        : context.colors.surface,
                    onTap: () {
                      context.read<AppSettingCubit>().changeThemeMode(themeMode);
                    },
                    title: themeMode.getTitle(context),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

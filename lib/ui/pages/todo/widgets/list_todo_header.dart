import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';

class ListTodoHeader extends StatefulWidget {
  const ListTodoHeader({super.key});

  @override
  State<ListTodoHeader> createState() => _ListTodoHeaderState();
}

class _ListTodoHeaderState extends State<ListTodoHeader> {
  void _changeLanguage(Language language) {
    context.read<AppSettingCubit>().changeLanguage(
      language: language.toggle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          BaseTextLabel(
            AppFormat.formatLongDate(DateTime.now()),
            color: AppColors.textWhite,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          BlocBuilder<AppSettingCubit, AppSettingState>(
            buildWhen: (prev, curr) => prev.language != curr.language,
            builder: (context, state) {
              final language = state.language;
              return IconButton(
                onPressed: () {
                  _changeLanguage(language);
                },
                icon: BaseTextLabel(language.flag, fontSize: 24),
              );
            },
          ),
          const SizedBox(height: 10),
          BaseTextLabel(
            S.of(context).my_todo_list,
            color: AppColors.textWhite,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ],
      ),
    );
  }
}

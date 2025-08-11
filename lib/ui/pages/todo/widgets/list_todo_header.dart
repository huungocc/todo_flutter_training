import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
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
      padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingLarge),
      child: Column(
        children: [
          BaseTextLabel(
            AppFormat.formatLongDate(DateTime.now()),
            style: AppTextStyle.whiteS18W400,
          ),
          BlocBuilder<AppSettingCubit, AppSettingState>(
            buildWhen: (prev, curr) => prev.language != curr.language,
            builder: (context, state) {
              final language = state.language;
              return IconButton(
                onPressed: () {
                  _changeLanguage(language);
                },
                icon: BaseTextLabel(language.flag, style: AppTextStyle.blackS24W400,),
              );
            },
          ),
          const SizedBox(height: 10),
          BaseTextLabel(
            S.of(context).my_todo_list,
            style: AppTextStyle.whiteS32Bold,
          ),
        ],
      ),
    );
  }
}

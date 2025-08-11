import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/todo/custom_todo_background.dart';

class AddTodoHeader extends StatefulWidget {
  const AddTodoHeader({super.key});

  @override
  State<AddTodoHeader> createState() => _AddTodoHeaderState();
}

class _AddTodoHeaderState extends State<AddTodoHeader> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const CustomTodoBackground(height: AppDimens.appBarLarge),
        Positioned(
          left: 16,
          top: 12,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Container(
              height: AppDimens.iconSizeLarge,
              width: AppDimens.iconSizeLarge,
              decoration: BoxDecoration(
                color: AppColors.textWhite,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.close, color: AppColors.textBlack),
            ),
          ),
        ),
        Positioned(
          top: 35,
          child: BlocBuilder<AddTodoCubit, AddTodoState>(
            buildWhen: (prev, curr) => prev.operation != curr.operation,
            builder: (context, state) {
              return BaseTextLabel(
                state.operation.isAdd
                    ? S.of(context).add_new_task
                    : S.of(context).edit_task,
                style: AppTextStyle.whiteS18W400,
              );
            },
          ),
        ),
      ],
    );
  }
}

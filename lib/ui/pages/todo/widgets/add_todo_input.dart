import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_radio_group.dart';

class AddTodoInput extends StatefulWidget {
  const AddTodoInput({super.key});

  @override
  State<AddTodoInput> createState() => _AddTodoInputState();
}

class _AddTodoInputState extends State<AddTodoInput> {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: _buildInputBody(context),
      resizeToAvoidBottomInset: true,
      hideAppBar: true,
      colorBackground: AppColors.todoBackground,
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: _buildSaveButton(context),
      ),
    );
  }

  Widget _buildInputBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: BlocBuilder<AddTodoCubit, AddTodoState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                const SizedBox.shrink(),

                /// Task Title
                BaseTextInput(
                  textController: state.taskTitleController,
                  title: S.of(context).task_title,
                  hintText: S.of(context).task_title,
                  cursorColor: AppColors.todoPurple,
                ),

                /// Category
                Row(
                  spacing: 20,
                  children: [
                    BaseTextLabel(
                      S.of(context).category,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    TodoRadioGroup(
                      initialSelected: state.selectedType,
                      onSelected: (selectedType) {
                        context.read<AddTodoCubit>().updateCategory(selectedType);
                      },
                    ),
                  ],
                ),

                /// Date & Time
                _buildPickerInput(context, state),

                /// Notes
                BaseTextInput(
                  textController: state.notesController,
                  title: S.of(context).notes,
                  hintText: S.of(context).notes,
                  cursorColor: AppColors.todoPurple,
                  minLines: 6,
                  maxLines: 6,
                ),

                const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildPickerInput(BuildContext context, AddTodoState state) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: BaseTextInput(
            textController: state.dateController,
            title: S.of(context).date,
            hintText: S.of(context).date,
            cursorColor: AppColors.todoPurple,
            readOnly: true,
            suffixIcon: Icon(Icons.date_range, color: AppColors.todoPurple),
            onTapSuffixIcon: () {
              context.read<AddTodoCubit>().pickDate(context);
            },
            onTap: () {
              context.read<AddTodoCubit>().pickDate(context);
            },
          ),
        ),
        Expanded(
          child: BaseTextInput(
            textController: state.timeController,
            title: S.of(context).time,
            hintText: S.of(context).time,
            cursorColor: AppColors.todoPurple,
            readOnly: true,
            suffixIcon: Icon(
              Icons.access_time_rounded,
              color: AppColors.todoPurple,
            ),
            onTapSuffixIcon: () {
              context.read<AddTodoCubit>().pickTime(context);
            },
            onTap: () {
              context.read<AddTodoCubit>().pickTime(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return BlocBuilder<AddTodoCubit, AddTodoState>(
      buildWhen: (prev, curr) =>
      prev.operation != curr.operation ||
          prev.status.isLoading != curr.status.isLoading,
      builder: (context, state) {
        return BaseButton(
          backgroundColor: AppColors.todoPurple,
          borderRadius: 50,
          height: 55,
          // Disable button while loading
          onTap: state.status.isLoading
              ? null
              : () {
            if (state.operation.isAdd) {
              context.read<AddTodoCubit>().addTodo();
            }
            if (state.operation.isUpdate) {
              context.read<AddTodoCubit>().updateTodo();
            }
          },
          child: state.status.isLoading
              ? BaseLoading(
            size: 30,
            backgroundColor: AppColors.textBlack,
            valueColor: AppColors.textWhite,
          )
              : BaseTextLabel(
            S.of(context).save,
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: AppColors.textWhite,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
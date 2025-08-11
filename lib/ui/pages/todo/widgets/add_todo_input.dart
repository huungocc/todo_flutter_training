import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
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
  void _onPickTime() {
    context.read<AddTodoCubit>().pickTime(context);
  }

  void _onPickDate() {
    context.read<AddTodoCubit>().pickDate(context);
  }

  void _onUpdateCategory(TodoItemType selectedType) {
    context.read<AddTodoCubit>().updateCategory(selectedType);
  }

  void _onUpdateTodo() {
    context.read<AddTodoCubit>().updateTodo();
  }

  void _onAddTodo() {
    context.read<AddTodoCubit>().addTodo();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: _buildInputBody(context),
      resizeToAvoidBottomInset: true,
      hideAppBar: true,
      colorBackground: AppColors.todoBackground,
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: _buildSaveButton(),
      ),
    );
  }

  Widget _buildInputBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
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
                ),

                /// Category
                Row(
                  spacing: 20,
                  children: [
                    BaseTextLabel(
                      S.of(context).category,
                      style: AppTextStyle.blackS16W500,
                    ),
                    BlocBuilder<AddTodoCubit, AddTodoState>(
                      buildWhen: (prev, curr) => prev.selectedType != curr.selectedType,
                      builder: (context, state) {
                        return TodoRadioGroup(
                          selected: state.selectedType,
                          onSelected: (selectedType) {
                            _onUpdateCategory(selectedType);
                          },
                        );
                      },
                    )
                  ],
                ),

                /// Date & Time
                _buildPickerInput(state),

                /// Notes
                BaseTextInput(
                  textController: state.notesController,
                  title: S.of(context).notes,
                  hintText: S.of(context).notes,
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

  Widget _buildPickerInput(AddTodoState state) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: BaseTextInput(
            textController: state.dateController,
            title: S.of(context).date,
            hintText: S.of(context).date,
            readOnly: true,
            suffixIcon: Icon(Icons.date_range, color: AppColors.todoPurple),
            onTap: () {
              _onPickDate();
            },
          ),
        ),
        Expanded(
          child: BaseTextInput(
            textController: state.timeController,
            title: S.of(context).time,
            hintText: S.of(context).time,
            readOnly: true,
            suffixIcon: Icon(
              Icons.access_time_rounded,
              color: AppColors.todoPurple,
            ),
            onTap: () {
              _onPickTime();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton() {
    return BlocBuilder<AddTodoCubit, AddTodoState>(
      buildWhen: (prev, curr) =>
      prev.operation != curr.operation ||
          prev.status.isLoading != curr.status.isLoading,
      builder: (context, state) {
        return BaseButton(
          backgroundColor: AppColors.todoPurple,
          onTap: state.status.isLoading
              ? null
              : () {
            if (state.operation.isAdd) {
              _onAddTodo();
            }
            if (state.operation.isUpdate) {
              _onUpdateTodo();
            }
          },
          child: state.status.isLoading
              ? BaseLoading(
            size: AppDimens.iconSizeNormal,
            backgroundColor: AppColors.textBlack,
            valueColor: AppColors.textWhite,
          )
              : BaseTextLabel(
            S.of(context).save,
            style: AppTextStyle.whiteS16W500,
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
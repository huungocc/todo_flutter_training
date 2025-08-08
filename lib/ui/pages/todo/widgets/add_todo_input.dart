import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/common/app_picker.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
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
  TodoItemType type = TodoItemType.list;

  final TextEditingController _keyTaskTitle = TextEditingController();
  final TextEditingController _keyTime = TextEditingController();
  final TextEditingController _keyDate = TextEditingController();
  final TextEditingController _keyNotes = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getData();
    });
  }

  void _getData() {
    final state = context.read<AddTodoCubit>().state;
    final todo = state.todo;

    _keyTaskTitle.text = todo.taskTitle ?? '';
    _keyDate.text = todo.date != null
        ? AppFormat.formatDateToDDMMYYYY(todo.date!)
        : '';
    _keyTime.text = todo.time != null
        ? AppFormat.convertTime24to12(todo.time!)
        : '';
    _keyNotes.text = todo.notes ?? '';

    type = _mapCategoryToType(todo.category);
  }

  void _pickDate() async {
    final selectedDate = await AppPicker.pickDate(context: context);
    if (selectedDate != null) {
      _keyDate.text = selectedDate;
    }
  }

  void _pickTime() async {
    final selectedTime = await AppPicker.pickTime(context: context);
    if (selectedTime != null) {
      _keyTime.text = selectedTime;
    }
  }

  void _onAddTodo() {
    _updateTodoEntity(
      taskTitle: _keyTaskTitle.text,
      date: AppFormat.parseDateFromDDMMYYYY(_keyDate.text),
      time: AppFormat.convertTime12hTo24hWithSeconds(_keyTime.text),
      notes: _keyNotes.text,
    );
    context.read<AddTodoCubit>().addTodo();
  }

  void _onUpdateTodo() {
    _updateTodoEntity(
      taskTitle: _keyTaskTitle.text,
      date: AppFormat.parseDateFromDDMMYYYY(_keyDate.text),
      time: AppFormat.convertTime12hTo24hWithSeconds(_keyTime.text),
      notes: _keyNotes.text,
    );
    context.read<AddTodoCubit>().updateTodo();
  }

  void _updateTodoEntity({
    String? taskTitle,
    DateTime? date,
    String? time,
    String? notes,
    String? category,
  }) {
    final state = context.read<AddTodoCubit>().state;
    final todo = state.todo.copyWith(
      taskTitle: taskTitle,
      date: date,
      time: time,
      notes: notes,
      category: category,
    );
    context.read<AddTodoCubit>().setTodoEntity(todo);
  }

  TodoItemType _mapCategoryToType(String? category) {
    switch (category) {
      case 'calendar':
        return TodoItemType.calendar;
      case 'trophy':
        return TodoItemType.trophy;
      case 'list':
      default:
        return TodoItemType.list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: _buildInput(context, type),
      resizeToAvoidBottomInset: true,
      hideAppBar: true,
      colorBackground: AppColors.todoBackground,
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: _buildSaveButton(context),
      ),
    );
  }

  Widget _buildInput(BuildContext context, TodoItemType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 20,
          children: [
            const SizedBox.shrink(),

            /// Task Title
            BaseTextInput(
              textController: _keyTaskTitle,
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
                  initialSelected: type,
                  onSelected: (selectedType) {
                    _updateTodoEntity(category: selectedType.name.toString());
                  },
                ),
              ],
            ),

            /// Date & Time
            _buildPickerInput(context),

            /// Notes
            BaseTextInput(
              textController: _keyNotes,
              title: S.of(context).notes,
              hintText: S.of(context).notes,
              cursorColor: AppColors.todoPurple,
              minLines: 6,
              maxLines: 6,
            ),

            const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerInput(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Expanded(
          child: BaseTextInput(
            textController: _keyDate,
            title: S.of(context).date,
            hintText: S.of(context).date,
            cursorColor: AppColors.todoPurple,
            suffixIcon: Icon(Icons.date_range, color: AppColors.todoPurple),
            onTapSuffixIcon: () {
              _pickDate();
            },
          ),
        ),
        Expanded(
          child: BaseTextInput(
            textController: _keyTime,
            title: S.of(context).time,
            hintText: S.of(context).time,
            cursorColor: AppColors.todoPurple,
            suffixIcon: Icon(
              Icons.access_time_rounded,
              color: AppColors.todoPurple,
            ),
            onTapSuffixIcon: () {
              _pickTime();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return BlocBuilder<AddTodoCubit, AddTodoState>(
      buildWhen: (prev, curr) =>
          prev.operation != curr.operation || prev.isLoading != curr.isLoading,
      builder: (context, state) {
        return BaseButton(
          backgroundColor: AppColors.todoPurple,
          borderRadius: 50,
          height: 55,
          // Disable button while loading
          onTap: state.isLoading
              ? null
              : () {
                  if (state.isAdd) {
                    _onAddTodo();
                  }
                  if (state.isUpdate) {
                    _onUpdateTodo();
                  }
                },
          child: state.isLoading
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

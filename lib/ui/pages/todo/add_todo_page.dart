import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/todo_item_type.dart';
import 'package:todo_flutter_training/network/api_client.dart';
import 'package:todo_flutter_training/network/api_util.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/todo_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_input.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/ui/widgets/todo/custom_todo_background.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_radio_group.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

class AddTodoPage extends StatelessWidget {
  final TodoEntity? arg;

  const AddTodoPage({super.key, this.arg});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(
        todoRepository: context.read<TodoRepository>(),
      ),
      child: _AddTodoBody(arg),
    );
  }
}

class _AddTodoBody extends StatefulWidget {
  final TodoEntity? arg;

  const _AddTodoBody(this.arg);

  @override
  State<_AddTodoBody> createState() => _AddTodoBodyState();
}

class _AddTodoBodyState extends State<_AddTodoBody> {
  final TextEditingController _keyTaskTitle = TextEditingController();
  final TextEditingController _keyTime = TextEditingController();
  final TextEditingController _keyDate = TextEditingController();
  final TextEditingController _keyNotes = TextEditingController();

  TodoEntity entity = TodoEntity();

  bool isUpdate = false;

  @override
  void initState() {
    super.initState();
    if (widget.arg != null) {
      isUpdate = true;
      entity = widget.arg!;
      _keyTaskTitle.text = widget.arg!.taskTitle!;
      _keyDate.text = AppFormat.formatDateToDDMMYYYY(widget.arg!.date!);
      _keyTime.text = AppFormat.convertTime24to12(widget.arg!.time!);
      _keyNotes.text = widget.arg!.notes!;
    }
  }

  @override
  Widget build(BuildContext context) {
    TodoItemType type = TodoItemType.list;
    switch (entity.category) {
      case 'list':
        type = TodoItemType.list;
      case 'calendar':
        type = TodoItemType.calendar;
      case 'trophy':
        type = TodoItemType.trophy;
    }

    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 70,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.todoBackground,
          body: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: BlocConsumer<TodoCubit, TodoState>(
              listener: (context, state) {
                // Handle success operations
                if (state.hasSuccess &&
                    (state.operation == TodoOperation.add ||
                        state.operation == TodoOperation.update)) {
                  Navigator.pop(context, true);
                  ExceptionHandler.showSuccessSnackBar(state.successMessage!);
                }
              },
              builder: (context, state) {
                return Stack(
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            const CustomTodoBackground(height: 90),
                            Positioned(
                              left: 16,
                              top: 12,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color: AppColors.textWhite,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: AppColors.textBlack,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 35,
                              child: BaseTextLabel(
                                isUpdate
                                    ? S.of(context).edit_task
                                    : S.of(context).add_new_task,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColors.textWhite,
                              ),
                            ),
                          ],
                        ),
                        _buildInput(context, type),
                        SafeArea(
                          child: BaseButton(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            backgroundColor: AppColors.todoPurple,
                            borderRadius: 50,
                            height: 55,
                            // Disable button while loading
                            onTap: state.isLoading
                                ? null
                                : () {
                                    if (_keyTaskTitle.text.isNotEmpty &&
                                        _keyDate.text.isNotEmpty &&
                                        _keyTime.text.isNotEmpty &&
                                        _keyNotes.text.isNotEmpty) {
                                      entity.taskTitle = _keyTaskTitle.text;
                                      entity.date =
                                          AppFormat.parseDateFromDDMMYYYY(
                                            _keyDate.text,
                                          );
                                      entity.time =
                                          AppFormat.convertTime12hTo24hWithSeconds(
                                            _keyTime.text,
                                          );
                                      entity.notes = _keyNotes.text;
                                      entity.category ??=
                                          TodoItemType.list.name;

                                      if (isUpdate) {
                                        context.read<TodoCubit>().updateTodo(
                                          entity,
                                        );
                                      } else {
                                        context.read<TodoCubit>().addTodo(
                                          entity,
                                        );
                                      }
                                    } else {
                                      ExceptionHandler.showErrorSnackBar(
                                        S.of(context).please_fill_in_all_fields,
                                      );
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
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildInput(BuildContext context, TodoItemType type) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              BaseTextInput(
                textController: _keyTaskTitle,
                margin: EdgeInsets.symmetric(vertical: 10),
                colorBgTextField: AppColors.textWhite,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray1, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.todoPurple, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                title: S.of(context).task_title,
                hintText: S.of(context).task_title,
                cursorColor: AppColors.todoPurple,
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
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
                        entity.category = selectedType.name.toString();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: BaseTextInput(
                      textController: _keyDate,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      colorBgTextField: AppColors.textWhite,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.gray1,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.todoPurple,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: S.of(context).date,
                      hintText: S.of(context).date,
                      cursorColor: AppColors.todoPurple,
                      suffixIcon: Icon(
                        Icons.date_range,
                        color: AppColors.todoPurple,
                      ),
                      onTapSuffixIcon: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: AppColors.todoPurple,
                                  onPrimary: AppColors.textWhite,
                                  onSurface: AppColors.textBlack,
                                  surface: Colors.white,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedDate != null) {
                          _keyDate.text = AppFormat.formatDateToDDMMYYYY(
                            pickedDate,
                          );
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: BaseTextInput(
                      textController: _keyTime,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      colorBgTextField: AppColors.textWhite,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.gray1,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.todoPurple,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: S.of(context).time,
                      hintText: S.of(context).time,
                      cursorColor: AppColors.todoPurple,
                      suffixIcon: Icon(
                        Icons.access_time_rounded,
                        color: AppColors.todoPurple,
                      ),
                      onTapSuffixIcon: () async {
                        TimeOfDay? pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ColorScheme.light(
                                  primary: AppColors.todoPurple,
                                  onPrimary: AppColors.textWhite,
                                  onSurface: AppColors.textBlack,
                                  surface: Colors.white,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedTime != null) {
                          _keyTime.text = AppFormat.formatPickedTimeTo12h(
                            pickedTime.hour,
                            pickedTime.minute,
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BaseTextInput(
                textController: _keyNotes,
                margin: EdgeInsets.symmetric(vertical: 10),
                colorBgTextField: AppColors.textWhite,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray1, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.todoPurple, width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                title: S.of(context).notes,
                hintText: S.of(context).notes,
                cursorColor: AppColors.todoPurple,
                minLines: 6,
                maxLines: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

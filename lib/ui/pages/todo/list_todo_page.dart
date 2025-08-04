import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:todo_flutter_training/network/api_client.dart';
import 'package:todo_flutter_training/network/api_util.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/add_todo_page.dart';
import 'package:todo_flutter_training/ui/pages/todo/todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/todo_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_dialog.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/ui/widgets/todo/custom_todo_background.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_info_card.dart';

class ListTodoPage extends StatelessWidget {
  const ListTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoCubit(
        todoRepository: TodoRepositoryImpl(
          apiClient: ApiClient(ApiUtil.client),
        ),
      ),
      child: _TodoBody(),
    );
  }
}

class _TodoBody extends StatefulWidget {
  const _TodoBody();

  @override
  State<_TodoBody> createState() => _TodoBodyState();
}

class _TodoBodyState extends State<_TodoBody> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    context.read<TodoCubit>().loadTodos();
  }

  void doneTask(TodoEntity todo) {
    BaseDialog.showNotifyDialog(
      message: S.of(context).complete_task,
      onConfirm: () {
        context.read<TodoCubit>().updateTodoStatus(todo, true);
      },
    );
  }

  void undoneTask(TodoEntity todo) {
    BaseDialog.showNotifyDialog(
      message: S.of(context).cancel_complete_task,
      onConfirm: () {
        context.read<TodoCubit>().updateTodoStatus(todo, false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      hideAppBar: true,
      isLightStatusBar: true,
      colorBackground: AppColors.todoBackground,
      body: Stack(
        children: [
          CustomTodoBackground(height: 250),
          Align(
            alignment: Alignment.center,
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  BaseTextLabel(
                    AppFormat.formatLongDate(DateTime.now()),
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  BlocBuilder<AppSettingCubit, AppSettingState>(
                    builder: (context, state) {
                      final language = state.language;

                      return IconButton(
                        onPressed: () {
                          context.read<AppSettingCubit>().changeLanguage(
                            language: language.toggle,
                          );
                        },
                        icon: BaseTextLabel(
                          language.flag,
                          fontSize: 24,
                        ),
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
                  const SizedBox(height: 30),
                  _buildContent(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: BaseButton(
          title: S.of(context).add_new_task,
          backgroundColor: AppColors.todoPurple,
          borderRadius: 50,
          onTap: () async {
            final isSuccess = await showModalBottomSheet<bool>(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (BuildContext context) {
                return AddTodoPage();
              },
            );
            if (!context.mounted) return;

            if (isSuccess == true) {
              getData();
            }
          },
        ),
      ),
    );
  }

  Expanded _buildContent() {
    return Expanded(
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.isLoading) {
            return BaseLoading(
              size: 50,
              backgroundColor: AppColors.textWhite,
              valueColor: AppColors.textBlack,
            );
          }

          if (state.isLoaded || state.hasData) {
            final todos = state.todos;
            final completed = state.completed;

            return ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black,
                  ],
                  stops: const [0.0, 0.96, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstOut,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildActiveTodos(todos, context),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 20,
                      ),
                      child: BaseTextLabel(
                        S.of(context).completed,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    _buildCompletedTodos(completed, context),
                  ],
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }

  Padding _buildCompletedTodos(
    List<TodoEntity> completed,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: (completed.isNotEmpty)
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: completed.length,
                separatorBuilder: (context, index) =>
                    Container(color: AppColors.todoBackground, height: 1),
                itemBuilder: (context, index) {
                  final complete = completed[index];
                  return TodoInfoCard(
                    title: complete.taskTitle,
                    time: AppFormat.convertTime24to12(complete.time!),
                    type: complete.category,
                    isCompleted: true,
                    onCheck: () {
                      BaseDialog.showNotifyDialog(
                        message: S.of(context).cancel_complete_task,
                        onConfirm: () {
                          context.read<TodoCubit>().updateTodoStatus(
                            complete,
                            false,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            )
          : TodoInfoCard(
              borderRadius: 20,
              title: S.of(context).no_data_yet,
              time: 'N/A',
              isCompleted: true,
            ),
    );
  }

  Padding _buildActiveTodos(List<TodoEntity> todos, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: (todos.isNotEmpty)
          ? ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: todos.length,
                separatorBuilder: (context, index) =>
                    Container(color: AppColors.todoBackground, height: 1),
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  final isExpired = AppFormat.isDateTimeExpired(
                    todo.date!,
                    todo.time!,
                  );
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    background: Container(
                      color: AppColors.error,
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    onDismissed: (direction) {
                      context.read<TodoCubit>().deleteTodo(todo);
                    },
                    key: Key(todo.id!),
                    child: TodoInfoCard(
                      title: todo.taskTitle,
                      type: todo.category,
                      time: AppFormat.convertTime24to12(todo.time!),
                      isExpired: isExpired,
                      onTap: () async {
                        final isSuccess = await showModalBottomSheet<bool>(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext context) {
                            return AddTodoPage(arg: todo);
                          },
                        );
                        if (!context.mounted) return;

                        if (isSuccess == true) {
                          context.read<TodoCubit>().loadTodos();
                        }
                      },
                      onCheck: () {
                        BaseDialog.showNotifyDialog(
                          message: S.of(context).complete_task,
                          onConfirm: () {
                            context.read<TodoCubit>().updateTodoStatus(
                              todo,
                              true,
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            )
          : TodoInfoCard(
              borderRadius: 20,
              title: S.of(context).no_data_yet,
              time: 'N/A',
            ),
    );
  }
}

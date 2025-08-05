import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
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
        todoRepository: context.read<TodoRepository>(),
      ),
      child: const _TodoBody(),
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
    _getData();
  }

  void _getData() {
    final cubit = context.read<TodoCubit>();
    cubit.loadTodos(isCompleted: false);
    cubit.loadTodos(isCompleted: true);
  }

  void _doneTask(TodoEntity todo) {
    BaseDialog.showNotifyDialog(
      message: S.of(context).complete_task,
      onConfirm: () {
        context.read<TodoCubit>().updateTodoStatus(todo, true);
      },
    );
  }

  void _undoneTask(TodoEntity todo) {
    BaseDialog.showNotifyDialog(
      message: S.of(context).cancel_complete_task,
      onConfirm: () {
        context.read<TodoCubit>().updateTodoStatus(todo, false);
      },
    );
  }

  void _openAddTodo({TodoEntity? todo}) async {
    final isSuccess = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddTodoPage(arg: todo,),
    );
    if (!context.mounted) return;
    if (isSuccess == true) {
      context.read<TodoCubit>().loadTodos(isCompleted: false);
    }
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
                  const SizedBox(height: 30),
                  Expanded(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Colors.transparent, Colors.black],
                          stops: [0.0, 0.96, 1.0],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstOut,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BlocBuilder<TodoCubit, TodoState>(
                              buildWhen: (prev, curr) =>
                              prev.todos != curr.todos || prev.status != curr.status,
                              builder: (context, state) {
                                if (state.isLoading) {
                                  return BaseLoading(
                                    size: 30,
                                    backgroundColor: AppColors.textWhite,
                                    valueColor: AppColors.textBlack,
                                  );
                                }
                                return _buildActiveTodos(state.todos, context);
                              },
                            ),
                            const SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 30,
                                children: [
                                  BaseTextLabel(
                                    S.of(context).completed,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                  BlocBuilder<TodoCubit, TodoState>(
                                    buildWhen: (prev, curr) => prev.completed != curr.completed,
                                    builder: (context, state) {
                                      if (state.isLoading) {
                                        return BaseLoading(
                                          size: 30,
                                          backgroundColor: AppColors.textWhite,
                                          valueColor: AppColors.textBlack,
                                        );
                                      }
                                      return _buildCompletedTodos(state.completed, context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
          onTap: () {
            _openAddTodo();
          },
        ),
      ),
    );
  }

  Padding _buildActiveTodos(List<TodoEntity> todos, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: todos.isNotEmpty
          ? ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: todos.length,
          separatorBuilder: (_, __) =>
              Container(color: AppColors.todoBackground, height: 1),
          itemBuilder: (context, index) {
            final todo = todos[index];
            final isExpired = AppFormat.isDateTimeExpired(todo.date!, todo.time!);
            return Dismissible(
              key: Key(todo.id!),
              direction: DismissDirection.endToStart,
              background: Container(
                color: AppColors.error,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (_) {
                context.read<TodoCubit>().deleteTodo(todo);
              },
              child: TodoInfoCard(
                title: todo.taskTitle,
                type: todo.category,
                time: AppFormat.convertTime24to12(todo.time!),
                isExpired: isExpired,
                onTap: () async {
                  _openAddTodo(todo: todo);
                },
                onCheck: () {
                  _doneTask(todo);
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

  Widget _buildCompletedTodos(List<TodoEntity> completed, BuildContext context) {
    return (completed.isNotEmpty)
        ? ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: completed.length,
        separatorBuilder: (_, __) =>
            Container(color: AppColors.todoBackground, height: 1),
        itemBuilder: (context, index) {
          final complete = completed[index];
          return TodoInfoCard(
            title: complete.taskTitle,
            time: AppFormat.convertTime24to12(complete.time!),
            type: complete.category,
            isCompleted: true,
            onCheck: () => _undoneTask(complete),
          );
        },
      ),
    )
        : TodoInfoCard(
      borderRadius: 20,
      title: S.of(context).no_data_yet,
      time: 'N/A',
      isCompleted: true,
    );
  }
}


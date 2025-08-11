import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/load_status.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/list_todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_page.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/list_todo_state.dart';
import 'package:todo_flutter_training/ui/widgets/base_dialog.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/common_widget.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_info_card.dart';

class ListTodoSection extends StatefulWidget {
  const ListTodoSection({super.key});

  @override
  State<ListTodoSection> createState() => _ListTodoSectionState();
}

class _ListTodoSectionState extends State<ListTodoSection> {
  void _reloadData(TodoType todoType) {
    context.read<ListTodoCubit>().fetchTodos(todoType);
  }

  void _onUpdateTodoStatus(TodoEntity todo) {
    BaseDialog.showNotifyDialog(
      message: S.of(context).complete_task,
      onConfirm: () {
        context.read<ListTodoCubit>().updateTodoStatus(todo);
      },
    );
  }

  void _onDeleteTodo(TodoEntity todo) {
    context.read<ListTodoCubit>().deleteTodo(todo);
  }

  void _onOpenTodo(TodoEntity todo) async {
    final isSuccess = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddTodoPage(arg: todo),
    );
    if (mounted) {
      if (isSuccess == true) {
        _reloadData(TodoType.active);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 30,
            children: [
              /// Build Active todos
              BlocBuilder<ListTodoCubit, ListTodoState>(
                buildWhen: (prev, curr) =>
                    prev.activeTodos != curr.activeTodos ||
                    prev.loadStatus != curr.loadStatus,
                builder: (context, state) {
                  if (state.loadStatus.isLoading) {
                    return BaseLoading(
                      size: 30,
                      backgroundColor: AppColors.textWhite,
                      valueColor: AppColors.textBlack,
                    );
                  }
                  return _buildActiveTodos(state.activeTodos, context);
                },
              ),

              BaseTextLabel(
                S.of(context).completed,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),

              /// Build Completed todos
              BlocBuilder<ListTodoCubit, ListTodoState>(
                buildWhen: (prev, curr) =>
                    prev.completedTodos != curr.completedTodos ||
                    prev.loadStatus != curr.loadStatus,
                builder: (context, state) {
                  if (state.loadStatus.isLoading) {
                    return BaseLoading(
                      size: 30,
                      backgroundColor: AppColors.textWhite,
                      valueColor: AppColors.textBlack,
                    );
                  }
                  return _buildCompletedTodos(state.completedTodos, context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActiveTodos(List<TodoEntity> activeTodos, BuildContext context) {
    return activeTodos.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activeTodos.length,
              separatorBuilder: (_, __) => CommonWidget.buildSeparator(),
              itemBuilder: (context, index) {
                final activeTodo = activeTodos[index];
                final isExpired = AppFormat.isDateTimeExpired(
                  activeTodo.date,
                  activeTodo.time,
                );
                return Dismissible(
                  key: Key(activeTodo.id!),
                  direction: DismissDirection.endToStart,
                  background: CommonWidget.buildDeleteBackground(),
                  onDismissed: (_) => _onDeleteTodo(activeTodo),
                  child: TodoInfoCard(
                    title: activeTodo.taskTitle,
                    type: activeTodo.category,
                    time: AppFormat.convertTime24to12(activeTodo.time!),
                    isExpired: isExpired,
                    onTap: () => _onOpenTodo(activeTodo),
                    onCheck: () => _onUpdateTodoStatus(activeTodo),
                  ),
                );
              },
            ),
          )
        : TodoInfoCard(
            borderRadius: 20,
            title: S.of(context).no_data_yet,
            time: 'N/A',
          );
  }

  Widget _buildCompletedTodos(
    List<TodoEntity> completedTodos,
    BuildContext context,
  ) {
    return completedTodos.isNotEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: completedTodos.length,
              separatorBuilder: (_, __) => CommonWidget.buildSeparator(),
              itemBuilder: (context, index) {
                final completedTodo = completedTodos[index];
                return Dismissible(
                  key: Key(completedTodo.id!),
                  direction: DismissDirection.endToStart,
                  background: CommonWidget.buildDeleteBackground(),
                  onDismissed: (_) => _onDeleteTodo(completedTodo),
                  child: TodoInfoCard(
                    title: completedTodo.taskTitle,
                    time: AppFormat.convertTime24to12(completedTodo.time!),
                    type: completedTodo.category,
                    isCompleted: true,
                    onCheck: () => _onUpdateTodoStatus(completedTodo),
                  ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/list_todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_page.dart';
import 'package:todo_flutter_training/ui/pages/todo/widgets/list_todo_header.dart';
import 'package:todo_flutter_training/ui/pages/todo/widgets/list_todo_section.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/todo/custom_todo_background.dart';

class ListTodoPage extends StatelessWidget {
  const ListTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListTodoCubit>(
      create: (_) =>
          ListTodoCubit(todoRepository: context.read<TodoRepository>()),
      child: const _ListTodoBody(),
    );
  }
}

class _ListTodoBody extends StatefulWidget {
  const _ListTodoBody();

  @override
  State<_ListTodoBody> createState() => _ListTodoBodyState();
}

class _ListTodoBodyState extends State<_ListTodoBody> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getTodos(TodoType.all);
    });
  }

  void _getTodos(TodoType todoType) {
    context.read<ListTodoCubit>().fetchTodos(todoType);
  }

  void _onAddTodo() async {
    final isSuccess = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const AddTodoPage(),
    );
    if (mounted) {
      if (isSuccess == true) {
        _getTodos(TodoType.active);
      }
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
          const CustomTodoBackground(height: AppDimens.appBarExtra),
          SafeArea(
            child: Column(
              spacing: 10,
              children: [const ListTodoHeader(), const ListTodoSection()],
            ),
          ),
        ],
      ),
      bottomBar: BottomAppBar(
        color: Colors.transparent,
        child: BaseButton(
          title: S.of(context).add_new_task,
          backgroundColor: AppColors.todoPurple,
          onTap: () {
            _onAddTodo();
          },
        ),
      ),
    );
  }
}

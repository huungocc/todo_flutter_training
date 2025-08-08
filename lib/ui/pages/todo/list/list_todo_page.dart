import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/global_blocs/setting/app_setting_cubit.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/language.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/active/active_todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/list/completed/completed_todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_page.dart';
import 'package:todo_flutter_training/ui/pages/todo/widgets/list_todo_section.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/todo/custom_todo_background.dart';

class ListTodoPage extends StatelessWidget {
  const ListTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ActiveTodoCubit>(
          create: (_) =>
              ActiveTodoCubit(todoRepository: context.read<TodoRepository>()),
        ),
        BlocProvider<CompletedTodoCubit>(
          create: (_) => CompletedTodoCubit(
            todoRepository: context.read<TodoRepository>(),
          ),
        ),
      ],
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
      _getActiveTodos();
      _getCompletedTodos();
    });
  }

  void _getActiveTodos() {
    context.read<ActiveTodoCubit>().loadTodos();
  }

  void _getCompletedTodos() {
    context.read<CompletedTodoCubit>().loadTodos();
  }

  void _onAddTodo() async {
    final todoEntity = TodoEntity();
    final isSuccess = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AddTodoPage(arg: todoEntity,),
    );
    if (mounted) {
      if (isSuccess == true) {
        _getActiveTodos();
      }
    }
  }

  void _changeLanguage(Language language) {
    context.read<AppSettingCubit>().changeLanguage(
      language: language.toggle,
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
          SafeArea(
            child: Column(
              spacing: 10,
              children: [
                _buildHeader(context),
                ListTodoSection()
              ],
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
            _onAddTodo();
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          BaseTextLabel(
            AppFormat.formatLongDate(DateTime.now()),
            color: AppColors.textWhite,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
          BlocBuilder<AppSettingCubit, AppSettingState>(
            buildWhen: (prev, curr) => prev.language != curr.language,
            builder: (context, state) {
              final language = state.language;
              return IconButton(
                onPressed: () {
                  _changeLanguage(language);
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
        ],
      ),
    );
  }
}

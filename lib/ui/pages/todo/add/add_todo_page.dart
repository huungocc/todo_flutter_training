import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_state.dart';
import 'package:todo_flutter_training/ui/pages/todo/widgets/add_todo_input.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/todo/custom_todo_background.dart';
import 'package:todo_flutter_training/utils/exception_handler.dart';

class AddTodoPage extends StatelessWidget {
  final TodoEntity? arg;

  const AddTodoPage({super.key, this.arg});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          AddTodoCubit(todoRepository: context.read<TodoRepository>()),
      child: _AddTodoBody(arg: arg),
    );
  }
}

class _AddTodoBody extends StatefulWidget {
  final TodoEntity? arg;

  const _AddTodoBody({this.arg});

  @override
  State<_AddTodoBody> createState() => _AddTodoBodyState();
}

class _AddTodoBodyState extends State<_AddTodoBody> {
  @override
  void initState() {
    super.initState();
    if (widget.arg != null) {
      context.read<AddTodoCubit>().setTodoEntity(widget.arg!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      child: Container(
        height: MediaQuery.of(context).size.height - 70,
        color: AppColors.todoBackground,
        child: Column(
          children: [
            BlocListener<AddTodoCubit, AddTodoState>(
              listenWhen: (prev, curr) =>
                  prev.hasSuccess != curr.hasSuccess ||
                  prev.operation != curr.operation,
              listener: (context, state) {
                // Handle success operations (Add, Update)
                if (state.hasSuccess &&
                    (state.isAdd ||
                        state.isUpdate)) {
                  Navigator.pop(context, true);
                  ExceptionHandler.showSuccessSnackBar(state.successMessage!);
                }
              },
              child: const SizedBox.shrink(),
            ),
            _buildHeader(context),
            Expanded(child: AddTodoInput()),
          ],
        ),
      ),
    );
  }

  Stack _buildHeader(BuildContext context) {
    return Stack(
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
                state.isAdd
                    ? S.of(context).add_new_task
                    : S.of(context).edit_task,
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: AppColors.textWhite,
              );
            },
          ),
        ),
      ],
    );
  }
}

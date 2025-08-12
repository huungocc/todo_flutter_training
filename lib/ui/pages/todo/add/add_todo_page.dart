import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/models/entities/todo/todo_entity.dart';
import 'package:todo_flutter_training/models/enums/operation_status.dart';
import 'package:todo_flutter_training/repository/todo_repository.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_cubit.dart';
import 'package:todo_flutter_training/ui/pages/todo/add/add_todo_state.dart';
import 'package:todo_flutter_training/ui/pages/todo/widgets/add_todo_header.dart';
import 'package:todo_flutter_training/ui/pages/todo/widgets/add_todo_input.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.arg != null) {
        context.read<AddTodoCubit>().setTodoEntity(widget.arg!);
      } else {
        context.read<AddTodoCubit>().setOperationStatus(OperationStatus.add);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
      child: Container(
        height: ScreenSize.instance().height - 70,
        color: AppColors.todoBackground,
        child: Column(
          children: [
            BlocListener<AddTodoCubit, AddTodoState>(
              listenWhen: (prev, curr) =>
                  prev.successMessage != curr.successMessage ||
                  prev.operation != curr.operation,
              listener: (context, state) {
                // Handle success operations (Add, Update)
                if (state.successMessage != null &&
                    (state.operation.isAdd || state.operation.isUpdate)) {
                  Navigator.pop(context, true);
                  ExceptionHandler.showSuccessSnackBar(state.successMessage!);
                }
              },
              child: const SizedBox.shrink(),
            ),
            const AddTodoHeader(),
            const Expanded(child: AddTodoInput()),
          ],
        ),
      ),
    );
  }
}

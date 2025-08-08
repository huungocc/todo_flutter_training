import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/gen/assets.gen.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';

class TodoIconWidget extends StatelessWidget {
  final TodoItemType type;
  final GestureTapCallback? onTap;
  final bool isSelected;

  const TodoIconWidget({
    super.key,
    required this.type,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget icon;
    Color color;

    switch (type) {
      case TodoItemType.list:
        icon = Assets.vectors.icTodoList.svg(height: 30);
        color = AppColors.bgListIcon;
        break;
      case TodoItemType.calendar:
        icon = Assets.vectors.icTodoCalendar2.svg(height: 30);
        color = AppColors.bgCalendarIcon;
        break;
      case TodoItemType.trophy:
        icon = Assets.vectors.icTodoTrophy.svg(height: 30);
        color = AppColors.bgTrophyIcon;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 3,
            color: isSelected ? AppColors.todoPurple : AppColors.textWhite,
          ),
        ),
        child: icon,
      ),
    );
  }
}

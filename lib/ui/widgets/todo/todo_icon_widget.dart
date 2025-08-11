import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
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
        icon = Assets.vectors.icTodoList.svg(height: AppDimens.iconSizeNormal);
        color = AppColors.bgListIcon;
        break;
      case TodoItemType.calendar:
        icon = Assets.vectors.icTodoCalendar2.svg(
          height: AppDimens.iconSizeNormal,
        );
        color = AppColors.bgCalendarIcon;
        break;
      case TodoItemType.trophy:
        icon = Assets.vectors.icTodoTrophy.svg(height: AppDimens.iconSizeNormal);
        color = AppColors.bgTrophyIcon;
        break;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppDimens.paddingNormal),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppDimens.iconBorderRadius),
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

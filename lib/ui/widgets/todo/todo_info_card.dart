import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/models/enums/todo_item_type.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_icon_widget.dart';

class TodoInfoCard extends StatelessWidget {
  final double? borderRadius;
  final String? title;
  final String? time;
  final String? type;
  final bool isCompleted;
  final bool isExpired;
  final Function? onCheck;
  final VoidCallback? onTap;

  const TodoInfoCard({
    super.key,
    this.borderRadius,
    this.title,
    this.time,
    this.type,
    this.isCompleted = false,
    this.isExpired = false,
    this.onTap,
    this.onCheck,
  });

  @override
  Widget build(BuildContext context) {
    TodoItemType todoType = TodoItemType.list;
    switch (type) {
      case 'list':
        todoType = TodoItemType.list;
      case 'calendar':
        todoType = TodoItemType.calendar;
      case 'trophy':
        todoType = TodoItemType.trophy;
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textWhite,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Row(
                    spacing: 15,
                    children: [
                      TodoIconWidget(type: todoType),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 4,
                          children: [
                            BaseTextLabel(
                              title,
                              fontSize: 16,
                              color: isExpired
                                  ? AppColors.error
                                  : AppColors.textBlack,
                              fontWeight: FontWeight.w600,
                              maxLines: 1,
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                            BaseTextLabel(
                              time,
                              fontSize: 16,
                              color: isExpired
                                  ? AppColors.subError
                                  : AppColors.buttonBGDisabled,
                              fontWeight: FontWeight.w500,
                              maxLines: 1,
                              decoration: isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (isCompleted)
                    Positioned.fill(
                      child: Container(color: Colors.white.withOpacity(0.7)),
                    ),
                ],
              ),
            ),
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                if (onCheck != null) onCheck!();
              },
            ),
          ],
        ),
      ),
    );
  }
}

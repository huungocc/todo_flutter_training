import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_icon_widget.dart';

class TodoInfoCard extends StatelessWidget {
  final double? borderRadius;
  final String? title;
  final String? time;
  final String? type;
  final bool isCompleted;
  final bool isExpired;
  final VoidCallback? onCheck;
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.textWhite,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  /// Todos Info
                  Row(
                    children: [
                      TodoIconWidget(type: type.toTodoItemType()),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BaseTextLabel(
                              title,
                              style: AppTextStyleExtension.taskTitle(
                                isExpired: isExpired,
                                isCompleted: isCompleted,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(height: 4),
                            BaseTextLabel(
                              time,
                              style: AppTextStyleExtension.taskTime(
                                isExpired: isExpired,
                                isCompleted: isCompleted,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// White Layer on Completed Todos
                  if (isCompleted)
                    Positioned.fill(
                      child: Container(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                ],
              ),
            ),
            Checkbox(
              value: isCompleted,
              onChanged: (_) => onCheck?.call(),
            ),
          ],
        ),
      ),
    );
  }
}

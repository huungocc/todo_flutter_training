import 'package:flutter/material.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
import 'package:todo_flutter_training/text_style/app_text_style.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_icon_widget.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';

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
          color: context.colors.onPrimary,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        padding: const EdgeInsets.all(20),
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
                              style: AppTextStyleExt.taskTitle(
                                context,
                                isExpired: isExpired,
                                isCompleted: isCompleted,
                              ),
                              maxLines: 1,
                            ),
                            const SizedBox(height: 4),
                            BaseTextLabel(
                              time,
                              style: AppTextStyleExt.taskTime(
                                context,
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
                ],
              ),
            ),
            Checkbox(value: isCompleted, onChanged: (_) => onCheck?.call()),
          ],
        ),
      ),
    );
  }
}

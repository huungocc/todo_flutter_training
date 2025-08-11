import 'package:flutter/material.dart';
import 'package:todo_flutter_training/models/enums/todo_type.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_icon_widget.dart';

class TodoRadioGroup extends StatelessWidget {
  final TodoItemType selected;
  final ValueChanged<TodoItemType> onSelected;

  const TodoRadioGroup({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: TodoItemType.values.map((type) {
        return TodoIconWidget(
          type: type,
          isSelected: selected == type,
          onTap: () => onSelected(type),
        );
      }).toList(),
    );
  }
}

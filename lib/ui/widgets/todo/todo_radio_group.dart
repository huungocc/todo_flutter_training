import 'package:flutter/material.dart';
import 'package:todo_flutter_training/models/enums/todo_item_type.dart';
import 'package:todo_flutter_training/ui/widgets/todo/todo_icon_widget.dart';

class TodoRadioGroup extends StatefulWidget {
  final TodoItemType initialSelected;
  final ValueChanged<TodoItemType> onSelected;

  const TodoRadioGroup({
    super.key,
    required this.initialSelected,
    required this.onSelected,
  });

  @override
  State<TodoRadioGroup> createState() => _TodoRadioGroupState();
}

class _TodoRadioGroupState extends State<TodoRadioGroup> {
  late TodoItemType selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      spacing: 10,
      children: TodoItemType.values.map((type) {
        return TodoIconWidget(
          type: type,
          isSelected: selected == type,
          onTap: () {
            setState(() => selected = type);
            widget.onSelected(type);
          },
        );
      }).toList(),
    );
  }
}

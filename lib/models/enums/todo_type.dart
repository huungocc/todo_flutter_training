enum TodoType { all, active, completed }

extension TodoTypeX on TodoType {
  bool? get completedStatus {
    switch (this) {
      case TodoType.all:
        return null;
      case TodoType.active:
        return false;
      case TodoType.completed:
        return true;
    }
  }
}

enum TodoItemType { list, calendar, trophy }

extension TodoItemTypeX on String? {
  TodoItemType toTodoItemType() {
    switch (this) {
      case 'calendar':
        return TodoItemType.calendar;
      case 'trophy':
        return TodoItemType.trophy;
      case 'list':
        return TodoItemType.list;
      default:
        return TodoItemType.list;
    }
  }
}

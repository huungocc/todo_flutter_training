enum TodoType {
  all,
  active,
  completed,
}

extension TodoTypeState on TodoType {
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

enum TodoItemType {
  list,
  calendar,
  trophy
}
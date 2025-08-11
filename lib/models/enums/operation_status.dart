enum OperationStatus {
  none,
  add,
  update,
  delete,
  updateStatus
}

extension OperationStatusExtension on OperationStatus {
  bool get isNone => this == OperationStatus.none;
  bool get isAdd => this == OperationStatus.add;
  bool get isUpdate => this == OperationStatus.update;
  bool get isDelete => this == OperationStatus.delete;
  bool get isUpdateStatus => this == OperationStatus.updateStatus;
}

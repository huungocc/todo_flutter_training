import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_format.dart';
import 'package:todo_flutter_training/common/app_theme.dart';

class AppPicker {
  /// Hiển thị Date Picker và trả về String định dạng dd/MM/yyyy
  static Future<String?> pickDate({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
  }) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return AppTheme.pickerTheme(context, child);
      },
    );
    if (pickedDate != null) {
      return AppFormat.formatDateToDDMMYYYY(pickedDate);
    }
    return null;
  }

  /// Hiển thị Time Picker và trả về String định dạng 12h
  static Future<String?> pickTime({
    required BuildContext context,
    TimeOfDay? initialTime,
  }) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: initialTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return AppTheme.pickerTheme(context, child);
      },
    );
    if (pickedTime != null) {
      return AppFormat.formatPickedTimeTo12h(
        pickedTime.hour,
        pickedTime.minute,
      );
    }
    return null;
  }
}

import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';

class CommonWidget {
  static Widget buildSeparator() {
    return Container(color: AppColors.todoBackground, height: 1);
  }

  static Widget buildDeleteBackground() {
    return Container(
      color: AppColors.error,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Icon(Icons.delete, color: Colors.white),
    );
  }
}

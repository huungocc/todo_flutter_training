import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';

class ExceptionHandler {
  static bool _isShowingSnackBar = false;

  static void showSuccessSnackBar(String message) {
    final context = NavigationConfig.context;
    if (context != null && !_isShowingSnackBar) {
      _isShowingSnackBar = true;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: BaseTextLabel(message),
          backgroundColor: Colors.greenAccent,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ).closed.then((_) {
        _isShowingSnackBar = false;
      });
    }
  }

  static void showErrorSnackBar(String message) {
    final context = NavigationConfig.context;
    if (context != null && !_isShowingSnackBar) {
      _isShowingSnackBar = true;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: BaseTextLabel(message),
          backgroundColor: Colors.white,
          duration: const Duration(seconds: 3),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ).closed.then((_) {
        _isShowingSnackBar = false;
      });
    }
  }
}
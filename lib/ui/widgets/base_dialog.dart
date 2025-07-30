import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';

class BaseDialog {
  static void showNotifyDialog({
    required String message,
    required VoidCallback onConfirm,
  }) {
    final context = NavigationConfig.context;
    if (context != null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: AppColors.textWhite,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 30,
                children: [
                  const Icon(
                    Icons.notifications_active_rounded,
                    size: 50,
                    color: AppColors.todoPurple,
                  ),
                  BaseTextLabel(
                    message,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.textBlack,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: BaseButton(
                          backgroundColor: AppColors.todoPurple,
                          title: 'OK',
                          titleColor: AppColors.textWhite,
                          borderRadius: 20,
                          onTap: () {
                            Navigator.pop(context);
                            onConfirm();
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: BaseButton(
                          backgroundColor: Colors.grey[200],
                          title: S.current.cancel,
                          titleColor: AppColors.textBlack,
                          borderRadius: 20,
                          onTap: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }

}

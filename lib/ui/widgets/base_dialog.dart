import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
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
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimens.paddingLarge),
            ),
            backgroundColor: AppColors.textWhite,
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingLarge),
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
                    style: AppTextStyle.blackS18Bold,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: BaseButton(
                          backgroundColor: AppColors.todoPurple,
                          title: S.of(context).ok,
                          onTap: () {
                            Navigator.pop(context);
                            onConfirm();
                          },
                        ),
                      ),
                      Expanded(
                        child: BaseButton(
                          backgroundColor: AppColors.gray1,
                          title: S.current.cancel,
                          titleStyle: AppTextStyle.blackS16W500,
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

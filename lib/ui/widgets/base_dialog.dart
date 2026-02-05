import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/configs/app_configs.dart';
import 'package:todo_flutter_training/generated/l10n.dart';
import 'package:todo_flutter_training/text_style/app_text_style.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';

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
            backgroundColor: context.colors.onPrimary,
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.paddingLarge),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 30,
                children: [
                  Icon(
                    Icons.notifications_active_rounded,
                    size: 50,
                    color: context.colors.primary,
                  ),
                  BaseTextLabel(
                    message,
                    style: context.appTextStyle.onSurface.s18.bold,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Expanded(
                        child: BaseButton(
                          title: S.of(context).ok,
                          onTap: () {
                            Navigator.pop(context);
                            onConfirm();
                          },
                        ),
                      ),
                      Expanded(
                        child: BaseButton(
                          title: S.current.cancel,
                          titleStyle: context.appTextStyle.onSurface.s16.w500,
                          backgroundColor: Colors.transparent,
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

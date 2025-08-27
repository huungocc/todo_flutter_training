import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/ui/widgets/base_button.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';

class SettingButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? action;

  const SettingButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      height: AppDimens.buttonHeight,
      backgroundColor: AppColors.textWhite,
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        spacing: 20,
        children: [
          Icon(icon),
          BaseTextLabel(title, style: AppTextStyle.blackS16),
          const Spacer(),
          action ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}

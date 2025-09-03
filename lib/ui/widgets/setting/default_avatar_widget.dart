import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';

class DefaultAvatarWidget extends StatelessWidget {
  const DefaultAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.gray1,
        child: const Icon(Icons.person, size: AppDimens.iconSizeLarge)
    );
  }
}
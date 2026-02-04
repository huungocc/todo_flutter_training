import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';

class DefaultAvatarWidget extends StatelessWidget {
  const DefaultAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: context.colors.onSurface.withValues(alpha: 0.5),
        child: const Icon(Icons.person, size: AppDimens.iconSizeLarge)
    );
  }
}
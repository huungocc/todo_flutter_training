import 'dart:io';
import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/ui/widgets/loading/base_loading.dart';

class BaseLocalImage extends StatelessWidget {
  final String filePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final VoidCallback? onEditTap;
  final bool showEditButton;

  const BaseLocalImage({
    super.key,
    required this.filePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.placeholder,
    this.errorWidget,
    this.onEditTap,
    this.showEditButton = false
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: filePath.isEmpty
              ? placeholder ??
              Container(
                width: width,
                height: height,
                color: Colors.grey.shade300,
                child: const Center(
                  child: BaseLoading(size: AppDimens.iconSizeNormal),
                ),
              )
              : Image.file(
            File(filePath),
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) =>
            errorWidget ??
                Container(
                  width: width,
                  height: height,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
          ),
        ),
        if (showEditButton)
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                onEditTap!();
              },
              child: Container(
                width: AppDimens.iconSizeNormal,
                height: AppDimens.iconSizeNormal,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: AppColors.todoPurple,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 3, color: AppColors.textWhite),
                ),
                child: const Icon(
                  Icons.edit,
                  color: AppColors.textWhite,
                  size: AppDimens.iconSizeSmall,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

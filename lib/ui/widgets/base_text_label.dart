import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';

class BaseTextLabel extends StatelessWidget {
  final String? title;
  final TextStyle? style;
  final TextAlign textAlign;
  final int? maxLines;
  final bool isRequired;

  const BaseTextLabel(
    this.title, {
    super.key,
    this.style,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = style ?? AppTextStyle.blackS16;

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 3,
      children: [
        Flexible(
          child: Text(
            title ?? "",
            textAlign: textAlign,
            overflow: TextOverflow.ellipsis,
            maxLines: maxLines,
            softWrap: true,
            style: textStyle,
          ),
        ),
        if (isRequired) ...[
          Text("*", style: textStyle.copyWith(color: AppColors.error)),
        ],
      ],
    );
  }
}

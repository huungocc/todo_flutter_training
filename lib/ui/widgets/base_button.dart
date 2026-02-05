import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/text_style/app_text_style.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';

class BaseButton extends StatelessWidget {
  final String? title;
  final BoxDecoration? decoration;
  final GestureTapCallback? onTap;
  final Widget? child;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? borderColor;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  final double? width;
  final double? height;
  final bool wrapChild;
  final TextStyle? titleStyle;
  final bool isDisable;

  const BaseButton({
    this.child,
    super.key,
    this.decoration,
    this.onTap,
    this.backgroundColor,
    this.borderRadius,
    this.borderColor = Colors.transparent,
    this.margin,
    this.padding,
    this.alignment,
    this.width,
    this.height,
    this.wrapChild = false,
    this.title,
    this.titleStyle,
    this.isDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.zero,
      alignment: alignment,
      decoration:
          decoration ??
          BoxDecoration(
            color:
                backgroundColor ??
                (isDisable
                    ? context.colors.primary.withValues(alpha: 0.5)
                    : context.colors.primary),
            border: Border.all(color: borderColor ?? Colors.transparent),
            borderRadius: BorderRadius.circular(
              borderRadius ?? AppDimens.buttonCornerRadius,
            ),
          ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(
            borderRadius ?? AppDimens.buttonCornerRadius,
          ),
          onTap: isDisable
              ? null
              : () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  onTap?.call();
                },
          child: Container(
            alignment: wrapChild ? null : Alignment.center,
            width: width,
            height: height,
            padding:
                padding ??
                const EdgeInsets.symmetric(
                  vertical: AppDimens.marginSmall,
                  horizontal: AppDimens.marginSmall,
                ),
            child: _renderChild(context),
          ),
        ),
      ),
    );
  }

  Widget _renderChild(BuildContext context) {
    if (title != null) {
      TextStyle style =
          titleStyle ??
          context.appTextStyle.onSurface.s16.w500.copyWith(
            color: AppColors.lightSurface,
          );

      if (isDisable) {
        style = style.copyWith(
          color: context.colors.primary.withValues(alpha: 0.5),
        );
      }

      return BaseTextLabel(title, style: style, textAlign: TextAlign.center);
    }
    return child ?? const SizedBox();
  }
}

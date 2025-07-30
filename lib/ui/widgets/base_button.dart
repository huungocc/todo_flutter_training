import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';

class BaseButton extends StatelessWidget {
  final String? title;
  final double? titleSize;
  final FontWeight? titleWeight;
  final BoxDecoration? decoration;
  final Color? shadowColor;
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
  final Color? titleColor;
  final bool isDisable;

  const BaseButton(
      {this.child,
        super.key,
        this.decoration,
        this.shadowColor,
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
        this.titleSize,
        this.titleWeight,
        this.titleColor,
        this.isDisable = false});

  @override
  Widget build(BuildContext context) {
    BorderRadius? borderRadiusInWell = BorderRadius.circular(0);
    if (borderRadius != null) {
      borderRadiusInWell = BorderRadius.circular(borderRadius!);
    }

    final Color effectiveBackgroundColor = isDisable
        ? AppColors.disableButton
        : (backgroundColor ?? AppColors.colorButton);

    return Container(
      margin: margin ?? EdgeInsets.zero,
      alignment: alignment,
      decoration: decoration ??
          BoxDecoration(
            color: effectiveBackgroundColor,
            border: Border.all(color: borderColor!),
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.transparent,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadiusInWell,
          onTap: isDisable ? null : () {
            FocusScope.of(context).requestFocus(FocusNode());
            onTap?.call();
          },
          child: Container(
              alignment: wrapChild ? null : Alignment.center,
              width: width,
              height: height,
              padding: padding ?? EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              child: renderChild()),
        ),
      ),
    );
  }

  renderChild() {
    if (title != null) {
      return BaseTextLabel(
        title,
        fontWeight: titleWeight ?? FontWeight.w500,
        fontSize: titleSize ?? 16,
        color: isDisable? AppColors.gray2 : titleColor ?? AppColors.textWhite,
        textAlign: TextAlign.center,
      );
    }
    return child ?? Container();
  }
}
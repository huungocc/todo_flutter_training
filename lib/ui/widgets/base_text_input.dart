import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/common/app_text_styles.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';

class BaseTextInput extends StatefulWidget {
  final String? title;
  final TextInputType keyboardType;
  final int maxLines;
  final int minLines;
  final String hintText;
  final EdgeInsets? margin;
  final double? borderRadius;
  final bool enabled;
  final int maxLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isRequired;
  final VoidCallback? onTapSuffixIcon;
  final TextStyle? hintStyle;
  final VoidCallback? onTap;
  final bool readOnly;
  final TextEditingController? textController;
  final TextStyle? textStyle;
  final Color? borderColor;
  final bool isPasswordTF;
  final String? initData;
  final ValueChanged<String>? onChanged;

  const BaseTextInput({
    super.key,
    this.title,
    this.borderRadius = 16,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.hintText = "",
    this.margin = const EdgeInsets.symmetric(vertical: 10),
    this.textController,
    this.enabled = true,
    this.maxLength = TextField.noMaxLength,
    this.suffixIcon,
    this.prefixIcon,
    this.isRequired = false,
    this.onTapSuffixIcon,
    this.hintStyle,
    this.onTap,
    this.readOnly = false,
    this.textStyle,
    this.borderColor,
    this.isPasswordTF = false,
    this.initData,
    this.onChanged
  });

  @override
  State<BaseTextInput> createState() => _BaseTextInputState();
}

class _BaseTextInputState extends State<BaseTextInput> {
  late TextEditingController _controller;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _controller = widget.textController ?? TextEditingController();
    _obscureText = widget.isPasswordTF;

    if (widget.initData != null) {
      _controller.text = widget.initData!;
    }
  }

  InputDecoration _buildDecoration() {
    return InputDecoration(
      counterText: "",
      suffixIcon: widget.isPasswordTF
          ? Padding(
        padding: EdgeInsets.only(right: AppDimens.marginSmall),
        child: InkWell(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
            color: AppColors.gray1,
          ),
        ),
      )
          : (widget.suffixIcon != null
          ? Padding(
        padding: EdgeInsets.only(right: AppDimens.marginSmall),
        child: InkWell(
          onTap: widget.onTapSuffixIcon,
          child: widget.suffixIcon,
        ),
      )
          : null),
      prefixIcon: widget.prefixIcon != null
          ? Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.marginSmall,
        ),
        child: widget.prefixIcon,
      )
          : null,
      focusColor: Colors.white,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: widget.borderColor ?? AppColors.gray1,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? AppDimens.textInputCornerRadius,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: widget.borderColor ?? AppColors.gray1,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? AppDimens.textInputCornerRadius,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.todoPurple, width: 1),
        borderRadius: BorderRadius.circular(
          widget.borderRadius ?? AppDimens.textInputCornerRadius,
        ),
      ),
      hintStyle: widget.hintStyle ??
          AppTextStyle.blackS16.copyWith(
            color: !widget.enabled
                ? AppColors.textBlack
                : AppColors.textFieldHint,
            fontWeight: FontWeight.w400,
          ),
      hintText: widget.hintText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          BaseTextLabel(
            widget.title,
            isRequired: widget.isRequired,
            style: AppTextStyle.blackS16W400,
          ),
        Container(
          width: double.infinity,
          margin: widget.margin,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: widget.enabled ? AppColors.textWhite : AppColors.gray2,
            borderRadius: BorderRadius.circular(
              widget.borderRadius ?? AppDimens.textInputCornerRadius,
            ),
          ),
          child: TextField(
            controller: _controller,
            keyboardType: widget.keyboardType,
            maxLength: widget.maxLength,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            textAlign: TextAlign.start,
            textAlignVertical: TextAlignVertical.center,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            style: widget.textStyle ?? AppTextStyle.blackS16,
            maxLines: widget.isPasswordTF ? 1 : widget.maxLines,
            minLines: widget.minLines,
            cursorColor: AppColors.todoPurple,
            obscureText: widget.isPasswordTF ? _obscureText : false,
            decoration: _buildDecoration(),
          ),
        ),
      ],
    );
  }
}

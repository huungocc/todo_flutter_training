import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/text_style/app_text_style.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';
import 'package:todo_flutter_training/utils/extension/context_extension.dart';

class BaseScreen extends StatelessWidget {
  final double? toolbarHeight;
  final Widget? body;
  final Widget? bottomBar;
  final String? title;
  final Widget? customAppBar;
  final Color? colorAppBar;
  final Function? onBackPress;
  final List<Widget>? rightWidgets;
  final Widget? floatingButton;
  final bool hiddenIconBack;
  final IconData? iconBack;
  final double? iconBackSize;
  final bool hideAppBar;
  final Widget? customBackground;
  final Color? iconBackColor;
  final bool isLightStatusBar;
  final bool resizeToAvoidBottomInset;

  const BaseScreen({
    super.key,
    this.body,
    this.bottomBar,
    this.title = "",
    this.customAppBar,
    this.colorAppBar,
    this.onBackPress,
    this.rightWidgets,
    this.hiddenIconBack = false,
    this.iconBack,
    this.iconBackSize,
    this.hideAppBar = false,
    this.floatingButton,
    this.customBackground,
    this.isLightStatusBar = false,
    this.toolbarHeight,
    this.iconBackColor,
    this.resizeToAvoidBottomInset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (customBackground != null) Positioned.fill(child: customBackground!),
        Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: hideAppBar ? null : (customAppBar ?? baseAppBar(context)),
          body: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                color: Colors.transparent,
                child: body,
              ),
            ],
          ),
          bottomNavigationBar: bottomBar,
          floatingActionButton: floatingButton,
        ),
      ],
    );
  }

  baseAppBar(BuildContext context) {
    Widget widgetTitle = BaseTextLabel(
      title?.toString(),
      maxLines: 2,
      style: context.appTextStyle.onPrimary.s18.w500.copyWith(
        color: AppColors.lightSurface,
      ),
      textAlign: TextAlign.center,
    );
    return AppBar(
      elevation: 0,
      toolbarHeight: toolbarHeight ?? AppDimens.appBarNormal,
      backgroundColor: colorAppBar ?? context.colors.primary,
      title: widgetTitle,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isLightStatusBar
            ? Brightness.light
            : Brightness.dark, // Android (light)
        statusBarBrightness: isLightStatusBar
            ? Brightness.dark
            : Brightness.light, // iOS (light)
      ),
      automaticallyImplyLeading: false,
      leading: hiddenIconBack
          ? null
          : InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                if (onBackPress != null) {
                  onBackPress?.call();
                } else {
                  Navigator.pop(context);
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: AppDimens.paddingNormal),
                child: Icon(
                  iconBack ?? Icons.arrow_back_rounded,
                  color: iconBackColor ?? AppColors.lightBackground,
                ),
              ),
            ),
      centerTitle: true,
      actions: rightWidgets ?? [],
    );
  }
}

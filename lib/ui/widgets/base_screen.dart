import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/common/app_demens.dart';
import 'package:todo_flutter_training/ui/widgets/base_text_label.dart';

class BaseScreen extends StatelessWidget {
  final double? toolbarHeight;
  final Widget? body;
  final Widget? bottomBar;
  final String? title;
  final Widget? customAppBar;
  final Color colorAppBar;
  final Function? onBackPress;
  final List<Widget>? rightWidgets;
  final Widget? floatingButton;
  final bool hiddenIconBack;
  final IconData? iconBack;
  final double? iconBackSize;
  final Color colorTitle;
  final bool hideAppBar;
  final Color colorBackground;
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
    this.colorAppBar = AppColors.background,
    this.onBackPress,
    this.rightWidgets,
    this.hiddenIconBack = false,
    this.iconBack,
    this.iconBackSize,
    this.colorTitle = AppColors.textWhite,
    this.hideAppBar = false,
    this.floatingButton,
    this.colorBackground = AppColors.background,
    this.customBackground,
    this.isLightStatusBar = false,
    this.toolbarHeight,
    this.iconBackColor = AppColors.textBlack,
    this.resizeToAvoidBottomInset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(color: colorBackground)),
        if (customBackground != null) Positioned.fill(child: customBackground!),
        Scaffold(
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: hideAppBar ? null : (customAppBar ?? baseAppBar(context)),
          backgroundColor: Colors.transparent,
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
        fontWeight: FontWeight.w700,
        fontSize: 16,
        textAlign: TextAlign.center,
        color: colorTitle,
      );
    return AppBar(
      elevation: 0,
      toolbarHeight: toolbarHeight ?? 50,
      backgroundColor: colorAppBar,
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
                  color: iconBackColor,
                ),
              ),
            ),
      centerTitle: true,
      actions: rightWidgets ?? [],
    );
  }
}

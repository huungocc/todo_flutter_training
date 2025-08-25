import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';
import 'package:todo_flutter_training/gen/assets.gen.dart';
import 'package:todo_flutter_training/ui/pages/app_start/splash/splash_navigator.dart';
import 'package:todo_flutter_training/ui/widgets/base_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthStatus(context);
  }

  void _checkAuthStatus(context) {
    Future.delayed(const Duration(seconds: 2), () {
      SplashNavigator(context: context).checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      colorBackground: AppColors.background,
      hideAppBar: true,
      body: Center(child: Assets.images.iconApp.image(scale: 5)),
    );
  }
}

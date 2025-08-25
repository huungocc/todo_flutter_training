import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_flutter_training/common/app_colors.dart';

class CustomAuthBackground extends StatelessWidget {
  const CustomAuthBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: -500 / 2,
            right: -500 / 2,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.todoBackground,
              ),
            ),
          ),
          Positioned(
            top: -600/2 + 30,
            right: -600/2 + 70,
            child: Container(
              width: 600,
              height: 600,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.todoBackground,
                  width: 3,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: -300,
            left: -400,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.todoBackground,
                  width: 3,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(-350, 600),
            child: Transform.rotate(
              angle: 45 * pi / 180,
              child: Container(
                width: 500,
                height: 500,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.todoBackground,
                    width: 3,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

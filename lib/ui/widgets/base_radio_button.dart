import 'package:flutter/material.dart';

class BaseRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  const BaseRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;

    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        width: size,
        height: size,
        padding: EdgeInsets.all(size * 0.2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? activeColor : inactiveColor,
            width: 1,
          )
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? activeColor : Colors.transparent
          )
        ),
      )
    );
  }
}

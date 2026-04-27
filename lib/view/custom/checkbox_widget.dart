import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  final Function(bool?)? onChanged;
  final double size;

  const CheckBoxWidget({
    super.key,
    this.isChecked = false,
    required this.onChanged,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged?.call(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeInOut,
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: isChecked
              ? const Color(0xFF12BBD3)
              : const Color(0xFFF1F1F1),
          borderRadius: BorderRadius.circular(6),
          border: isChecked
              ? null
              : Border.all(
            color: const Color(0xFFECECEC),
            width: 1,
          ),
        ),
        child: isChecked
            ? Icon(
          Icons.check,
          color: Colors.white,
          size: size * 0.70,
          weight: 900,
        )
            : null,
      ),
    );
  }
}
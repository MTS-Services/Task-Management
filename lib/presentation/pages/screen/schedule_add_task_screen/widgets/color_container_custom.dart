import 'package:flutter/material.dart';

class ColorContainerCustom extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final bool isSelected;

  ColorContainerCustom({
    required this.color,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: isSelected
            ? Icon(Icons.check, color: Colors.white, size: 17)
            : null,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ColorContainerCustom extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
 final Widget? child;

  ColorContainerCustom({
    required this.color,
    required this.onTap,
     this.child,
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
        child: child,
      ),
    );
  }
}

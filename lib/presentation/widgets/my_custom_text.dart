import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String tName;
  final double? fSize;
  final FontWeight? fWeight;
  final Color? color;
  final double? lSpacing;
  final int? mLines;
  final TextAlign? tAlign;
  final TextOverflow? overflow;
  final void Function()? onTap;

  const CustomText({
    super.key,
    required this.tName,
    this.fSize,
    this.fWeight,
    this.color,
    this.lSpacing,
    this.mLines,
    this.tAlign,
    this.onTap,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        maxLines: mLines,
        textAlign: tAlign,
        overflow: overflow,
        tName,
        style: TextStyle(
          fontSize: fSize,
          fontWeight: fWeight,
          color: color,
          letterSpacing: lSpacing,
        ),
      ),
    );
  }
}

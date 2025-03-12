import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      required this.size,
      required this.fontWeight,
      required this.color});
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      style: TextStyle(fontWeight: fontWeight, fontSize: size, color: color),
    );
  }
}

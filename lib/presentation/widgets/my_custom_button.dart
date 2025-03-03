import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/color.dart';

class MyCustomButton extends StatelessWidget {
  final String? buttonName;
  final Color? buttonColor;
  final BoxBorder? border;
  final void Function()? onTap;
  final EdgeInsetsGeometry? margin;
  const MyCustomButton({
    super.key,
    this.buttonName,
    this.buttonColor,
    this.border,
    this.onTap,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        margin: margin,
        decoration: BoxDecoration(
            color: RColors.blueButtonColors,
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text("Login"),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class TopBarWidget extends StatelessWidget {
  final List<Widget>? optionalWidgets; // Accept multiple widgets

  const TopBarWidget({super.key, this.optionalWidgets, required this.text});
  // Constructor
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(
          text: text,
          size: 26,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        Row(
          children: [
            if (optionalWidgets != null) ...optionalWidgets!,
          ],
        ),
      ],
    );
  }
}

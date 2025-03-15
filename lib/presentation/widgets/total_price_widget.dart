import 'package:flutter/material.dart';

class TotalPriceWidget extends StatelessWidget {
   TotalPriceWidget({
    super.key,
    this.icon,
    required this.text,
  });

  final String? icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if(icon != null)
        Image.asset(
          icon!,
          width: 20,
          height: 20,
          color: Colors.black54,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

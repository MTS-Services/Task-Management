import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class TotalProjectInfoBar extends StatelessWidget {
  const TotalProjectInfoBar({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    List<String> barName = [
      'Team Target:',
      'Carry Forward:',
      'Canceled Project:',
    ];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListTile(
        title: TextWidget(
          text: barName[index],
          size: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: TextWidget(
          text: '\$15,000',
          size: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 7,
              spreadRadius: 2,
            )
          ]),
    );
  }
}

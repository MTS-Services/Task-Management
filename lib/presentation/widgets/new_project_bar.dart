import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class NewProjectCard extends StatelessWidget {
  const NewProjectCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListTile(
        title: TextWidget(
          text: 'Danial Project',
          size: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: TextWidget(
          text:
              'The Project contains 3 screens, 1 splash screen and an app icon.',
          size: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularPercentIndicator(
              radius: 20.0,
              lineWidth: 5.0,
              percent: 0.35,
              center: Text(
                "35%",
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
              ),
              progressColor: Colors.green,
              backgroundColor: Colors.grey.shade200,
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              blurRadius: 5,
              spreadRadius: 2,
            )
          ]),
    );
  }
}

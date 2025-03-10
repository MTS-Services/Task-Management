import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class TotalContainer extends StatelessWidget {
  const TotalContainer(
      {super.key, required this.text, required this.projectNumber});
  final String text;
  final String projectNumber;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      height: MediaQuery.sizeOf(context).height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: text,
            size: screenWidth * 0.03,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          TextWidget(
            text: projectNumber,
            size: screenWidth * 0.04,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}

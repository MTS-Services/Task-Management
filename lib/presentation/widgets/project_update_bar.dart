import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class ProjectUpdateBar extends StatelessWidget {
  const ProjectUpdateBar({super.key, required this.updateName, required this.updateComment});
  final String updateName;
  final String updateComment;


  @override
  Widget build(BuildContext context) {
    
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: ListTile(
        title: TextWidget(
          text: updateName,
          size: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subtitle: TextWidget(
          text: updateComment,
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
import 'package:flutter/material.dart';
import 'package:maktrack/presentation/pages/screen/Project_Update/project_update.dart';

class UpdateIcon extends StatelessWidget {
  const UpdateIcon(
      {super.key,
      required this.progressPercentage,
      required this.selectedUpdateOption,
      required this.selectedUpdateComment});
  final String? progressPercentage;
  final String selectedUpdateOption;
  final String selectedUpdateComment;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ProjectUpdate(
            selectedProgressPercentage: progressPercentage,
            selectedUpdateOption: selectedUpdateOption,
            selectedUpdateComment: selectedUpdateComment,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

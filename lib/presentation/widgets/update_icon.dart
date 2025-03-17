import 'package:flutter/material.dart';
import 'package:maktrack/presentation/pages/screen/Project_Update/project_update.dart';

class UpdateIcon extends StatefulWidget {
  const UpdateIcon({
    super.key,
    required this.progressPercentage, required this.commentController, required this.onConfirm,
  });
  final TextEditingController progressPercentage;
  final TextEditingController commentController;
  final Function(String updateName) onConfirm;

  @override
  State<UpdateIcon> createState() => _UpdateIconState();
}

class _UpdateIconState extends State<UpdateIcon> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProjectUpdate(
              selectedProgressPercentage: widget.progressPercentage,
              selectedCommentController: widget.commentController,
              onConfirm: widget.onConfirm,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xff61C877)  ,
        ),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

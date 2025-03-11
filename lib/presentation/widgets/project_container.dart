import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/screen/ProjectDetails/project_details.dart';

class ProjectContainer extends StatelessWidget {
  const ProjectContainer({
    super.key,
    required this.child,
    required this.imageIndex, // Accept an index for the image
  });

  final Widget child;
  final int imageIndex; // The index of the selected background image

  @override
  Widget build(BuildContext context) {
    final List<String> backGroundImage = [
      'assets/images/PHP frame 1.png',
      'assets/images/Laravel frame 1.png',
      'assets/images/MERN frame 1.png',
      'assets/images/flutter frame 1.png',
    ];

    // Select the background image based on the provided index
    String selectedImage = backGroundImage[imageIndex];

    return GestureDetector(
      onTap: () {
        Get.to(() => ProjectDetails());
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(selectedImage),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}

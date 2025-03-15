import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class TeamAvater extends StatelessWidget {
  const TeamAvater({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: 'Team',
          size: 15,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange[100],
              child: Icon(
                Icons.person,
              ),
            ),
            Positioned(
              left: 25,
              child: CircleAvatar(
                backgroundColor: Colors.blue[200],
                child: Icon(
                  Icons.person,
                ),
              ),
            ),
            Positioned(
              left: 50,
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                ),
              ),
            ),
            Positioned(
              left: 75,
              child: CircleAvatar(
                backgroundColor: Color(0xffFFCE93),
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

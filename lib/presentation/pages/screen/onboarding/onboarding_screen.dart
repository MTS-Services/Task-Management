import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/color.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.accessible_forward_rounded,
                  color: Colors.purple,
                  size: 40,
                ),
                Text(
                  "MakTech",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: RColors.blueButtonColors,
                      fontSize: 25),
                ),
              ],
            ),
            Image.asset("assets/images/task.png"),
            Text(
              "Smart Task\nManagement",
              style: TextStyle(
                  fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 3),
            ),
            Text(
              "This smart tool is designed to help you\nbetter mange your task",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[400]),
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.5)),
              child: Center(
                child: Text(
                  "Login",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
      body: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.accessible_forward_rounded,
              ),
              Text(
                "hello bangladesh",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: RColors.blueButtonColors,
                    fontSize: 22),
              ),
            ],
          )
        ],
      ),
    );
  }
}

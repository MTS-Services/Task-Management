import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    AssetPath.logoPng,
                    height: 50,
                    width: 100,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
              Image.asset(
                AssetPath.taskMangeImage,
                height: 340,
                width: double.infinity,
                fit: BoxFit.fitHeight,
              ),
              Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Smart Task\nManagement",
                    style: TextStyle(
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3),
                  ),
                  Text(
                    "This smart tool is designed to help you\nbetter mange your task",
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[400]),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black12,
                          width: 1.5,
                        )),
                    child: Center(
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, letterSpacing: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: RColors.blackButtonColor2,
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: Center(
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

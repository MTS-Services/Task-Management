import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/auth/sing_in_screen.dart';
import 'package:maktrack/presentation/pages/auth/sing_up_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 25),
              child: Row(
                children: [
                  Image.asset(
                    AssetPath.logoPng,
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.25,
                    fit: BoxFit.fitWidth,
                  )
                ],
              ),
            ),
            Image.asset(
              AssetPath.taskMangeImage,
              height: screenHeight * 0.38,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Smart Task\nManagement",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 33),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "This smart tool is designed to help you\nbetter mange your task",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: RColors.smallFontColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: RColors.blackButtonColor1),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingInScreen()));
                      },
                      child: Text("LOGIN"),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.07,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: RColors.blueButtonColors,
                          foregroundColor: Colors.white),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SingUpScreen()));
                      },
                      child: Text(
                        "SING UP",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

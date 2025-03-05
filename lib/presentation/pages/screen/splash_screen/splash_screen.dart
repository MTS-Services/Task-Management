import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/screen/onboarding/onboarding_screen.dart';




class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: RColors.blackButtonColor1));


    return Scaffold(
      backgroundColor: RColors.blackButtonColor1,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Container(
                    color: RColors.blackButtonColor1,
                    child: Image.asset(
                      AssetPath.basePathTitle,
                      height: 250,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ],
            ),
            LottieBuilder.asset("assets/lottie/Animation - 1741059464680.json"),
          ],
        ),
      ),
    );
  }
}

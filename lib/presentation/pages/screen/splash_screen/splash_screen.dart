import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
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
    Timer(Duration(seconds: 3), () {
      Get.offAll(
            () => OnboardingScreen(),
        transition: Transition.rightToLeft,
        duration: Duration(
          milliseconds: 750,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black54, statusBarBrightness: Brightness.dark));

    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Container(
                    color: Colors.black54,
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

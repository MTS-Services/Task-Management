import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        AssetPath.logoPng,
                        height: 50,
                        width: 100,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Image.asset(
                  AssetPath.taskMangeImage,
                  // height: screenHeight * 0.38,
                  height: 310,
                  width: double.infinity,
                  fit: BoxFit.fitHeight,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Smart Task Management",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 33),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "This smart tool is designed to help you better mange your task",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: RColors.smallFontColor,
                            ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: RColors.blackButtonColor1),
                          onPressed: () {
                            Get.offAll(
                              () => SingInScreen(),
                              transition: Transition.rightToLeft,
                              duration: Duration(
                                milliseconds:750,
                              ),
                            );
                          },
                          child: Text("LOG IN"),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: RColors.blueButtonColors,
                              foregroundColor: Colors.white),
                          onPressed: () {
                            Get.offAll(
                                  () => SingUpScreen(),
                              transition: Transition.rightToLeft,
                              duration: Duration(
                                milliseconds: 750,
                              ),
                            );
                          },
                          child: Text(
                            "SIGN UP",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

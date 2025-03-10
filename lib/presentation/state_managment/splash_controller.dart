import 'dart:async';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/screen/onboarding/onboarding_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(
        () => const OnboardingScreen(),
        transition: Transition.rightToLeft,
        duration: const Duration(milliseconds: 750),
      );
    });
  }
}

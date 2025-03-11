import 'dart:async';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/screen/onboarding/onboarding_screen.dart';
class SplashController extends GetxController {
  var showLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    startProcess();
  }

  void startProcess() {
    Future.delayed(const Duration(seconds: 3), () {
      showLoading.value = true;

      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(
              () => const OnboardingScreen(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 750),
        );
      });
    });
  }
}

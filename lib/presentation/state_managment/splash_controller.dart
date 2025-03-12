import 'dart:async';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/screen/threeScreen/onboarding_page.dart';

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
          () => const ThreeScreenPage(),
          transition: Transition.rightToLeft,
          duration: const Duration(milliseconds: 750),
        );
      });
    });
  }
}

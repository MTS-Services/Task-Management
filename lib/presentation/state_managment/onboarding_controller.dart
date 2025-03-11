import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/auth/sing_in_screen.dart';
import 'package:maktrack/presentation/pages/auth/sing_up_screen.dart';

class OnboardingController extends GetxController {
  var isLoading = false.obs;

  void startLoading() {
    isLoading.value = true;
  }

  void stopLoading() {
    isLoading.value = false;
  }

  void navigateToSingIN() async {
    startLoading();
    await Future.delayed(Duration(seconds: 1));
    stopLoading();
    Get.offAll(() => SingInScreen(),
        transition: Transition.leftToRight, curve: Curves.easeIn);
  }

  void navigateToSignUp() async {
    startLoading();
    await Future.delayed(Duration(seconds: 1));
    stopLoading();
    Get.offAll(() => SingUpScreen(), curve: Curves.easeIn);
  }

  PageController pageController = PageController();
  RxBool onLastPage = false.obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/auth/sing_in_screen.dart';
import 'package:maktrack/presentation/pages/auth/sing_up_screen.dart';
import 'package:maktrack/presentation/pages/screen/DashBoard/dash_board.dart';

class OnboardingController extends GetxController {
  var isLoading = false.obs; // Observable variable

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
    Get.offAll(() => SingUpScreen(),
        transition: Transition.zoom,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeIn);
  }

  PageController pageController = PageController();
  RxBool onLastPage = false.obs;

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

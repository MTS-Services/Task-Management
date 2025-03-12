import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/screen/scheduleScreen/schedule_screen.dart';

class BottomController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    ScheduleScreen(),
    const Center(child: Text("Files Page")),
    const Center(child: Text("Send Page")),
    const Center(child: Text("Profile Page")),
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}

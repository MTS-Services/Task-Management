import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/asset_path.dart';

class BottomController extends GetxController {
  RxInt selectedIndex = 0.obs;


  final List<Widget> pages = [
    // ScheduleScreen(),
    const Center(child: Text("Dashboard Page")),
    const Center(child: Text("Files Page")),
    const Center(child: Text("Task Page")),
    const Center(child: Text("Send Page")),
    const Center(child: Text("Profile Page")),
  ];

  RxList<String> navIcons = [
    AssetPath.basePathListImage,
    AssetPath.basePathDocFileImage,
    AssetPath.basePathSendImage,
    AssetPath.basePathAvatarImage,
  ].obs;


  void changeIndex(int index) {
    print("_______________${selectedIndex.value}__________________");
    selectedIndex.value = index;
  }

}



import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/state_managment/bottom_controller.dart';

class Bottom extends StatelessWidget {
  Bottom({super.key});

  final BottomController controller = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomAppBar(
          color: Colors.grey[100],
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => controller.changeIndex(0),
                  child: Image.asset(
                    AssetPath.basePathListImage,
                    color:
                        controller.selectedIndex.value == 0 ? Colors.red : null,
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.changeIndex(1),
                  child: Image.asset(
                    AssetPath.basePathDocFileImage,
                    color:
                        controller.selectedIndex.value == 1 ? Colors.red : null,
                  ),
                ),
                const SizedBox(width: 48),
                GestureDetector(
                  onTap: () => controller.changeIndex(2),
                  child: Image.asset(
                    AssetPath.basePathSendImage,
                    color:
                        controller.selectedIndex.value == 2 ? Colors.red : null,
                  ),
                ),
                GestureDetector(
                  onTap: () => controller.changeIndex(3),
                  child: CircleAvatar(
                    radius: 15,
                    child: Image.asset(
                      AssetPath.basePathAvatarImage,
                    ),

                    // backgroundColor: controller.selectedIndex.value == 3
                    //     ? RColors.blueButtonColors
                    //     : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: RColors.blueButtonColors,
        shape: const CircleBorder(),
        child: Image.asset(AssetPath.basePathImage),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

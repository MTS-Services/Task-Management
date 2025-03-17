import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/state_managment/bottom_controller.dart';

class Bottom extends StatelessWidget {
  Bottom({super.key});

  final BottomController controller = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.pages[controller.selectedIndex.value],
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(controller.navIcons.length, (index) {
                    return IconButton(
                      onPressed: () => controller.changeIndex(index),
                      icon: Obx(() => Image.asset(
                            controller.navIcons[index],
                            color: controller.selectedIndex.value == index
                                ? RColors.blueButtonColors
                                : null,
                          )),
                    );
                  }),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}

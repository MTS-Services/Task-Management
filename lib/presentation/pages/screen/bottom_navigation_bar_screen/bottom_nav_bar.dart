import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/screen/task_add_screen.dart';
import 'package:maktrack/presentation/state_managment/bottom_controller.dart';

import '../../leader_input_screen.dart';

class Bottom extends StatelessWidget {
  Bottom({super.key});

  final BottomController controller = Get.put(BottomController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: controller.pages[controller.selectedIndex.value],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(),
              color: Color(0xfffafcfd),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              child: BottomAppBar(
                elevation: 0,
                color: Colors.white,
                shape: const CircularNotchedRectangle(),
                notchMargin: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:
                        List.generate(controller.navIcons.length, (index) {
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
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(() => TaskAddScreen());
            },
            backgroundColor: RColors.blueButtonColors,
            shape: const CircleBorder(),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}

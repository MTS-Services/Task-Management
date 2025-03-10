import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maktrack/presentation/state_managment/home.dart';
import 'widgets/calendar_pop_up.dart';

class HomeScreen extends StatelessWidget {
  final CalendarController controller = Get.put(CalendarController());
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Obx(() => Text(
                      controller.formattedDate.value,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                    IconButton(
                      icon:
                      const Icon(Icons.calendar_today, color: Colors.black),
                      onPressed: controller.toggleCalendar,
                    ),
                  ],
                ),
                Container(height: 40, width: double.infinity, color: Colors.red)
              ],
            ),
            Obx(() => controller.showCalendar.value
                ? CalendarPopup(controller: controller)
                : SizedBox.shrink()),
          ],
        ),
      ),
    );
  }
}
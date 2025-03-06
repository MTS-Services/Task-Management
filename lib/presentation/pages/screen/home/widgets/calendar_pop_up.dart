import 'package:flutter/material.dart';
import 'package:maktrack/presentation/state_managment/home.dart';

import 'custom_calendar.dart';

class CalendarPopup extends StatelessWidget {
  final CalendarController controller;
  const CalendarPopup({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.57,
      width: size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            offset: Offset(0, 7),
            blurRadius: 24,
          ),
        ],
      ),
      child: Column(
        children: [
          CustomCalendarWidget(controller: controller),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: controller.onCancel,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child:
                    const Text("Cancel", style: TextStyle(color: Colors.white)),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: controller.onConfirm,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: const Text("OK", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

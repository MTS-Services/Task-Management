import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/presentation/state_managment/home.dart';

import 'custom_calendar.dart';

class CalendarPopup extends StatelessWidget {
  final CalendarController controller;
  const CalendarPopup({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
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
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: size.height * 0.6,
        ),
        child: SingleChildScrollView(
          child: GetBuilder<CalendarController>(
            builder: (controller) {
              return CustomCalendarWidget(controller: controller);
            },
          ),
        ),
      ),
    );
  }
}

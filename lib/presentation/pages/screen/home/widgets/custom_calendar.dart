import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/state_managment/home.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarWidget extends StatelessWidget {
  final CalendarController controller;
  const CustomCalendarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      daysOfWeekHeight: 28,
      focusedDay: controller.focusedDay.value,
      firstDay: DateTime(2000),
      lastDay: DateTime(2100),
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) => isSameDay(controller.selectedDay.value, day),
      onDaySelected: (selectedDay, focusedDay) {
        controller.onDaySelected(selectedDay, focusedDay);
      },
      calendarStyle: CalendarStyle(
        todayDecoration: BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        selectedDecoration: BoxDecoration(
          color:  RColors.blueButtonColors,
          shape: BoxShape.circle,
        ),
        defaultDecoration: BoxDecoration(
          color: Colors.transparent,
        ),
        weekendTextStyle: TextStyle(color: Colors.red),
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
        rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
        titleTextStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
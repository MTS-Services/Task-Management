import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: 'March 10, 2025',
          size: 15,
          fontWeight: FontWeight.normal,
          color: Color(0xffDFE1E3),
        ),
        const SizedBox(width: 10), // Add spacing
        GestureDetector(
          onTap: () {
            print('Calendar icon tapped');
            _showCalendarDialog(context); // Show calendar dialog
          },
          child: Image.asset(
            'assets/Icons/calender 1.png',
            scale: 4.5,
          ),
        ),
      ],
    );
  }

  void _showCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select a Date'),
          content: SizedBox(
            height: 370,
            width: 350,
            child: Calendar(),
          ), // Show the calendar inside the dialog
          actions: [
            TextButton(
              onPressed: () {},
              child: Text('Cancle'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  Widget Calendar() {
    DateTime today = DateTime.now();
    return TableCalendar(
      focusedDay: today,
      firstDay: DateTime.utc(2000, 01, 01),
      lastDay: DateTime.utc(2050, 12, 30),
      daysOfWeekHeight: 30,
      
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextFormatter: (date, locale) {
          final weekDay = DateFormat.E(locale).format(date);
          return '$weekDay  ';
        },
        weekdayStyle: TextStyle(color: Colors.grey),
        weekendStyle: TextStyle(color: Colors.red),
      ),
      rowHeight: 46,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
    );
  }
}

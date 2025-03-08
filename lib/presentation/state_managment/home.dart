import 'package:get/get.dart';

class CalendarController extends GetxController {
  var showCalendar = false.obs;
  var formattedDate = ''.obs;
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;

  void toggleCalendar() {
    showCalendar.value = !showCalendar.value;
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
    formattedDate.value = "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}"; // Update the formatted date
  }
}



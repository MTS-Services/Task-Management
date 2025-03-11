// import 'package:get/get.dart';
//
// class CalendarController extends GetxController {
//   var showCalendar = false.obs;
//   var formattedDate = ''.obs;
//   var focusedDay = DateTime.now().obs;
//   var selectedDay = DateTime.now().obs;
//
//
//   void toggleCalendar() {
//     showCalendar.value = !showCalendar.value;
//   }
//
//   void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     this.selectedDay.value = selectedDay;
//     this.focusedDay.value = focusedDay;
//     formattedDate.value = "${selectedDay.year}-${selectedDay.month}-${selectedDay.day}"; // Update the formatted date
//   }
// }
//

import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting

class CalendarController extends GetxController {
  var showCalendar = false.obs;
  var isLoaing = false.obs;

  // Initial date set as today’s date
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;
  var today = DateTime.now();

  // Properly formatted initial date
  var formattedDate = DateFormat('MMMM dd, yyyy').format(DateTime.now()).obs;

  void toggleCalendar() {
    showCalendar.value = !showCalendar.value;
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
    formattedDate.value = DateFormat('MMMM dd, yyyy')
        .format(selectedDay); // Update formatted date
  }
}

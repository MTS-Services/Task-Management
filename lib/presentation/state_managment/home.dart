import 'package:get/get.dart';
import 'package:intl/intl.dart'; // For date formatting

class CalendarController extends GetxController {
  var showCalendar = false.obs;


  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;

  var formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;

  void toggleCalendar() {
    showCalendar.value = !showCalendar.value;
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    this.selectedDay.value = selectedDay;
    this.focusedDay.value = focusedDay;
    formattedDate.value = DateFormat('yyyy-MM-dd').format(selectedDay); // Update formatted date
  }
}

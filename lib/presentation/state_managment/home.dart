import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CalendarController extends GetxController {
  var showCalendar = false.obs;
  var selectedDay = Rxn<DateTime>();
  var focusedDay = DateTime.now().obs;
  var formattedDate = "Select a date".obs;

  void toggleCalendar() => showCalendar.value = !showCalendar.value;

  void onDaySelected(DateTime day, DateTime focus) {
    selectedDay.value = day;
    focusedDay.value = focus;
    formattedDate.value = DateFormat('dd MMMM yyyy').format(day);
    update();
  }

  void onCancel() => showCalendar.value = false;

  void onConfirm() {
    if (selectedDay.value != null) {
      formattedDate.value = DateFormat('dd MMMM yyyy').format(selectedDay.value!);
      showCalendar.value = false;
    }
  }
}



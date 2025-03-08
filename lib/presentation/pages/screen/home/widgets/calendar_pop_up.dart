// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:maktrack/domain/entities/color.dart';
// import 'package:maktrack/presentation/state_managment/home.dart';
//
// import 'custom_calendar.dart';
//
// class CalendarPopup extends StatelessWidget {
//   final CalendarController controller;
//   const CalendarPopup({super.key, required this.controller});
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       height: size.height * 0.40,
//       width: size.width,
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(30),
//           bottomRight: Radius.circular(30),
//         ),
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             color: Color(0x12000000),
//             offset: Offset(0, 7),
//             blurRadius: 24,
//           ),
//         ],
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             GetBuilder<CalendarController>(
//               builder: (controller) =>
//                   CustomCalendarWidget(controller: controller),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   onPressed: controller.onCancel,
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(10, 15),
//                     backgroundColor: Colors.white,
//                   ),
//                   child: const Text("Cancel",
//                       style: TextStyle(color: Colors.black, fontSize: 10)),
//                 ),
//                 SizedBox(width: 20),
//                 ElevatedButton(
//                   onPressed: controller.onConfirm,
//                   style: ElevatedButton.styleFrom(
//                       minimumSize: Size(10, 15),
//                       backgroundColor: RColors.blueButtonColors),
//                   child: const Text("OK",
//                       style: TextStyle(color: Colors.white, fontSize: 10)),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

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

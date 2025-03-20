import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/add_task_text_field_custom_widget.dart';

class AddTaskScheduleScreen extends StatefulWidget {
  const AddTaskScheduleScreen({super.key});

  @override
  State<AddTaskScheduleScreen> createState() => _AddTaskScheduleScreenState();
}

class _AddTaskScheduleScreenState extends State<AddTaskScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Task",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  AddTaskTextFieldCustomWidget(),

                ],
              ),
            ),
          )),
    );
  }
}
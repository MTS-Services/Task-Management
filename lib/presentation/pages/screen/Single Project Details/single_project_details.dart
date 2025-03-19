import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/screen/schedule_screen/schedule_screen.dart';
import 'package:maktrack/presentation/widgets/date_selector.dart';
import 'package:maktrack/presentation/widgets/background_container.dart';
import 'package:maktrack/presentation/widgets/project_update_bar.dart';
import 'package:maktrack/presentation/widgets/team_avater.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';
import 'package:maktrack/presentation/widgets/update_icon.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SingleProjectDetails extends StatefulWidget {
  const SingleProjectDetails({super.key});

  @override
  State<SingleProjectDetails> createState() => _SingleProjectDetailsState();
}

class _SingleProjectDetailsState extends State<SingleProjectDetails> {
  final TextEditingController progressPercentage =
      TextEditingController(); // Make it a class variable
  final TextEditingController commentController =
      TextEditingController(); // Make it a class variable
  String selectedUpdateOption = '';
  List<Map<String, String>> projectUpdates = [];

  @override
  void initState() {
    super.initState();
    progressPercentage.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    progressPercentage.dispose();
    commentController.dispose();
    super.dispose();
  }

  // Function to update the selected update name
  void _addProjectUpdate(String updateName, String comment) {
    setState(() {
      // Retrieve the last known percentage if available
      String lastPercentage = projectUpdates.isNotEmpty
          ? projectUpdates.last['percentage'] ?? '0'
          : '0';

      // Use input value if provided, otherwise keep the last known percentage
      String newPercentage = progressPercentage.text.isNotEmpty
          ? progressPercentage.text
          : lastPercentage;

      //  Store percentage in the list
      projectUpdates.add({
        'updateName': updateName,
        'comment': comment,
        'percentage': newPercentage, //  Fix: Store percentage
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              BackgroundContainer(
                child: Column(
                  spacing: 25,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        TextWidget(
                          text: 'App Project',
                          size: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.to(() => ScheduleScreen());
                            },
                            child: Image.asset(
                              'assets/Icons/calender 1.png',
                              height: 25,
                              width: 25,
                              fit: BoxFit.fitHeight,
                            )),
                      ],
                    ),
                    Row(
                      spacing: 40,
                      children: [
                        CircularPercentIndicator(
                          radius: 50.0,
                          lineWidth: 12.0,
                          percent: (double.tryParse(projectUpdates.isNotEmpty
                                      ? projectUpdates.last['percentage'] ?? '0'
                                      : '0') ??
                                  0.0) /
                              100.0, //  Use last known percentage
                          center: Text(
                            projectUpdates.isNotEmpty
                                ? '${projectUpdates.last['percentage']}%'
                                : '0%',
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          progressColor: Color(0xff61C877),
                          backgroundColor: Colors.grey.shade200,
                          circularStrokeCap: CircularStrokeCap.round,
                        ),
                        TeamAvater(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          spacing: 10,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                color: Color(0xffEDF8F0),
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(28),
                                  left: Radius.circular(28),
                                ),
                              ),
                              child: TextWidget(
                                  text: 'App',
                                  size: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.green),
                            ),
                            UpdateIcon(
                              progressPercentage: progressPercentage,
                              commentController: commentController,
                              onConfirm: (updateName) {
                                _addProjectUpdate(
                                    updateName, commentController.text);
                              }, // Fix here
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.only(
                              left: 22, right: 22, top: 12, bottom: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(28),
                                left: Radius.circular(28),
                              ),
                              border: Border.all(
                                  color: Colors.grey.shade400, width: 0.5)),
                          child: TextWidget(
                            text: 'Done',
                            size: 13,
                            fontWeight: FontWeight.normal,
                            color: RColors.smallFontColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              DateSelector(),
              SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: projectUpdates.length,
                itemBuilder: (context, index) {
                  return ProjectUpdateBar(
                    updateName: projectUpdates[index]['updateName'] ?? '',
                    updateComment: projectUpdates[index]['comment'] ?? '',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

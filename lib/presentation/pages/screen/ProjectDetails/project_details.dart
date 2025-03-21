import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/screen/view_task_screen.dart';
import 'package:maktrack/presentation/pages/auth/super_admin_panel.dart';
import 'package:maktrack/presentation/widgets/Calendar%20Widgets/calendar_pop_up.dart';
import 'package:maktrack/presentation/widgets/new_project_bar.dart';
import 'package:maktrack/presentation/widgets/project_container.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';
import '../../../state_managment/home.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CalendarController controller = Get.put(CalendarController());
    final List<String> progressName = [
      'Total Project',
      'In Process',
      'NRA',
      'Complete',
    ];
    final List<String> progressIcon = [
      'assets/Icons/Progress.png',
      'assets/Icons/Clock.png',
      'assets/Icons/Time.png',
      'assets/Icons/Complete.png',
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              padding: EdgeInsets.only(left: 25, right: 20, top: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              height: MediaQuery.sizeOf(context).height > 800
                  ? MediaQuery.sizeOf(context).height * 0.42
                  : MediaQuery.sizeOf(context).height * 0.48,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            spacing: 15,
                            children: [
                              Obx(
                                () => Text(
                                  controller.formattedDate.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff707070),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Toggle the calendar visibility
                                  controller.toggleCalendar();
                                },
                                child: Image.asset(
                                  'assets/Icons/calender 1.png',
                                  scale: 4.5,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 20,
                            children: [
                              Image.asset(
                                'assets/Icons/zoom-tool.png',
                                scale: 15,
                              ),
                              Image.asset(
                                'assets/Icons/menus.png',
                                scale: 15,
                              ),
                            ],
                          )
                        ],
                      ),
                      TextWidget(
                          text: 'Project Details',
                          size: 25,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                      Expanded(
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: progressName.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 1.7,
                          ),
                          itemBuilder: (context, index) {
                            return ProjectContainer(
                              imageIndex: index,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  right: 15,
                                  left: 15,
                                  bottom: 12,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          progressIcon[index],
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.04,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.06,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text: progressName[index],
                                          size: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                        TextWidget(
                                          text: '40',
                                          size: 13,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                    TextWidget(
                                      text: '15,000.00',
                                      size: 13,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => controller.showCalendar.value
                        ? CalendarPopup(controller: controller)
                        : SizedBox.shrink(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Recent Projects',
                    size: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => ViewTaskScreen(),
                      );
                    },
                    child: TextWidget(
                      text: 'All Tasks',
                      size: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(4, (index) {
                return NewProjectCard();
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => SuperAdminPanel());
        },
        child: Icon(
          Icons.admin_panel_settings,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

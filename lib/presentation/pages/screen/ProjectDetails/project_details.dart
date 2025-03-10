import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/project_container.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> progressName = [
      'On Going',
      'In Process',
      'Complete',
      'Cancel',
    ];
    final List<String> progressIcon = [
      'assets/Icons/Progress.png',
      'assets/Icons/Clock.png',
      'assets/Icons/Time.png',
      'assets/Icons/Complete.png',
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
          child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 25, right: 20, top: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
            height: MediaQuery.sizeOf(context).height > 800
                ? MediaQuery.sizeOf(context).height * 0.42
                : MediaQuery.sizeOf(context).height * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Image.asset(
                                  progressIcon[index],
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.04,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.06,
                                ),
                              ],
                            ),
                            TextWidget(
                              text: progressName[index],
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}

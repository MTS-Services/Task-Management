import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/widgets/date_selector.dart';
import 'package:maktrack/presentation/widgets/background_container.dart';
import 'package:maktrack/presentation/widgets/project_update_bar.dart';
import 'package:maktrack/presentation/widgets/team_avater.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';
import 'package:maktrack/presentation/widgets/update_icon.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SingleProjectDetails extends StatelessWidget {
  const SingleProjectDetails({super.key});

  @override
  Widget build(BuildContext context) {
    String? progressPercentage;
    String selectedUpdateOption = '';
    String selectedUpdateComment = '';
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
                    SizedBox(
                      height: 10,
                    ),
                    TextWidget(
                      text: 'App Project',
                      size: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    Row(
                      spacing: 40,
                      children: [
                        CircularPercentIndicator(
                          radius: 50.0,
                          lineWidth: 12.0,
                          percent: 0.35,
                          center: Text(
                            '$progressPercentage %',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          progressColor: Colors.green,
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
                              selectedUpdateOption: selectedUpdateOption,
                              selectedUpdateComment: selectedUpdateComment,
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
              ProjectUpdateBar(),
            ],
          ),
        ),
      ),
    );
  }
}

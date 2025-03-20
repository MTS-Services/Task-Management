import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:maktrack/presentation/pages/screen/Project_Update/project_update.dart';
import 'package:maktrack/presentation/pages/screen/Single%20Project%20Details/single_project_details.dart';
import 'package:maktrack/presentation/widgets/text_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../domain/entities/color.dart';

class ProjectTabCard extends StatelessWidget {
  const ProjectTabCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: StaggeredGrid.count(
          axisDirection: AxisDirection.down,
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          children: List.generate(
            500,
            (index) {
              return StaggeredGridTile.fit(
                crossAxisCellCount: 1,
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => SingleProjectDetails());
                  },
                  child: Container(
                    height: index % 2 == 0 ? 250 : 50,
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.white : Colors.transparent,
                      borderRadius:
                          index % 2 == 0 ? BorderRadius.circular(30) : null,
                      // boxShadow: index % 2 == 0
                      //     ? [
                      //         BoxShadow(
                      //             color: Colors.grey,
                      //             offset: Offset(2, 1),
                      //             spreadRadius:1,
                      //             blurRadius: 8)
                      //       ]
                      //     : null,
                    ),
                    child: index % 2 == 0
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              spacing: 13,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: CircularPercentIndicator(
                                    radius: 20,
                                    percent: 0.35,
                                    progressColor: Colors.green,
                                    lineWidth: 6,
                                  ),
                                ),
                                Text(
                                  "mm/dd/yyyy",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 12,
                                        color: RColors.smallFontColor,
                                      ),
                                ),
                                Text(
                                  "Timeline : 6days",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                        fontSize: 12,
                                        color: RColors.smallFontColor,
                                      ),
                                ),
                                Text(
                                  "Loading page Wireframe",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                    top: 5,
                                    bottom: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffEDF8F0),
                                    borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(28),
                                      left: Radius.circular(28),
                                    ),
                                  ),
                                  child: TextWidget(
                                    text: 'web',
                                    size: 15,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : SizedBox(),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

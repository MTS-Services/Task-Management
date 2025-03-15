import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/widgets/top_bar_widget.dart';
import '../../widgets/project_tab_card.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({super.key});

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

class _ViewTaskScreenState extends State<ViewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            backgroundColor: RColors.bgColorColorS,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Column(
                children: [
                  TopBarWidget(
                    text: "Projects",
                    optionalWidgets: [
                      Image.asset(
                        AssetPath.zoomPng,
                        height: 40,
                        width: 40,
                      ),
                      SizedBox(width: 20),
                      Image.asset(
                        AssetPath.menuPng,
                        height: 40,
                        width: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  ProjectTebCard(),
                ],
              ),
            )));
  }
}

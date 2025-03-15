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
        ),
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Container(
              width: double.infinity,
              color: Colors.transparent,
              child: Image.asset(
                "assets/onboarding/At work-cuate (2).png",
              )),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "DISCOVERY",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                Text(
                  "DISCOVER TASKS\n& TRACK PROGRESS",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/my_custom_text.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            color: Colors.transparent,
            // child: Image.asset(
            //   "assets/images/onboarding/onboarding2.png",
            //   fit: BoxFit.cover,
            // )
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                tName: "Find a Working",
                fSize: 26,
                lSpacing: 2,
                fWeight: FontWeight.w500,
              ),
              CustomText(
                tAlign: TextAlign.start,
                tName: "Space",
                fSize: 30,
                lSpacing: 5,
                fWeight: FontWeight.bold,
              ),
              const SizedBox(height: 30),
              CustomText(
                mLines: 3,
                tName:
                    "Find coworking space easily\nand quickly through this\napplication.",
                color: Colors.grey,
                lSpacing: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}

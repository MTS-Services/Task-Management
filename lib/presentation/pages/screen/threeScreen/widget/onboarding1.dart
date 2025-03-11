

import 'package:flutter/material.dart';
import 'package:maktrack/presentation/widgets/my_custom_text.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width: double.infinity,
            color: Colors.transparent,
            // child: Image.asset(
            //   "assets/images/onboarding/onboarding1.png",
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
                tName: "Welcome to ",
                fSize: 26,
                lSpacing: 2,
                fWeight: FontWeight.w500,
              ),
              CustomText(
                tAlign: TextAlign.start,
                tName: "Cowork",
                fSize: 30,
                lSpacing: 5,
                fWeight: FontWeight.bold,
              ),
              const SizedBox(height: 30),
              CustomText(
                mLines: 3,
                tName:
                    "Work and organize events\nwith friends outside the\noffice to get rid of boredom.",
                color: Colors.grey,
                lSpacing: 2,
              )
            ],
          ),
        )
      ],
    );
  }
}

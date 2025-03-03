import 'package:flutter/material.dart';
import 'package:maktrack/domain/entities/asset_path.dart';
import 'package:maktrack/domain/entities/color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RColors.blackButtonColor1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 40,
            bottom: 80,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: RColors.blackButtonColor1,
                child: Image.asset(
                  AssetPath.basePathTitle,
                  height: 280,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      color: RColors.blackButtonColor1,
                      child: Image.asset(
                        AssetPath.basePathGreenBeen,
                        height: 300,
                        fit: BoxFit.fitHeight,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

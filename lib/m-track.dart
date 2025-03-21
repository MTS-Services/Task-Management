import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/screen/three_screen/onboarding_page.dart';


class MTrac extends StatelessWidget {
  const MTrac({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: RColors.bgColorColorS,
            fontFamily: "PromoTest",
            textTheme: _buildTextTheme(),
            inputDecorationTheme: _buildInputDecorationTheme(context),
            elevatedButtonTheme: _buildElevatedButtonThemeData()),
        home: ThreeScreenPage());
  }

  ElevatedButtonThemeData _buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: RColors.blueButtonColors,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: RColors.blueButtonColors,
        ),
      ),
    ));
  }

  TextTheme _buildTextTheme() {
    return TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
      ),
    );
  }

  InputDecorationTheme _buildInputDecorationTheme(BuildContext context) {
    return InputDecorationTheme(
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: RColors.smallFontColor,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: RColors.smallFontColor,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: RColors.errorColors,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: RColors.smallFontColor,
          ),
      errorStyle: TextStyle(
        fontSize: 12,
        color: RColors.errorColors,
      ),
    );
  }
}

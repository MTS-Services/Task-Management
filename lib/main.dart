import 'package:flutter/material.dart';

import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/auth/sing_up_screen.dart';


import 'package:maktrack/presentation/pages/screen/home/home_screen.dart';
import 'package:maktrack/presentation/pages/screen/onboarding/onboarding_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "PromoTest",
        textTheme: _buildTextTheme(),
       inputDecorationTheme: _buildInputDecorationTheme(context),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: RColors.blackButtonColor1,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          )
        )
      ),
      home: SingUpScreen()

theme: ThemeData(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
    ),
  )
),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),

    );
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
       focusedBorder:UnderlineInputBorder(
         borderSide: BorderSide(
           color: RColors.smallFontColor,

         ),
       ),
       contentPadding: EdgeInsets.symmetric(
         vertical: 12,
         horizontal:5
       ),
      hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
        color: RColors.smallFontColor
      )
     );
  }
}


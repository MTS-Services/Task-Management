import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:maktrack/firebase_options.dart';
import 'package:maktrack/m-track.dart';

import 'package:get/get.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/screen/bottomNavBar/bottom_nav_bar.dart';





Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MTrac());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "PromoTest",
          textTheme: _buildTextTheme(),
          inputDecorationTheme: _buildInputDecorationTheme(context),
          elevatedButtonTheme: _buildElevatedButtonThemeData()),
      home: BottomNavBarPage(),
    );
  }





  TextTheme _buildTextTheme() {
    return TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
      ),
    );
  }



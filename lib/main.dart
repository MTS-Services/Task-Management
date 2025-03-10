import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:maktrack/firebase_options.dart';
import 'package:maktrack/m-track.dart';

import 'package:get/get.dart';
import 'package:maktrack/domain/entities/color.dart';
import 'package:maktrack/presentation/pages/screen/bottomNavBar/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MTrac());

}










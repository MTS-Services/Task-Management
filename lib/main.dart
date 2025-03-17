import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maktrack/database/database_helper.dart';

import 'package:maktrack/firebase_options.dart';
import 'package:maktrack/m-track.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDatabase();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MTrac());

}





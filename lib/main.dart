import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ramadan_planner/views/auth_screen/register.dart';
import 'package:ramadan_planner/views/splash_screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: const FirebaseOptions(
    //   apiKey: "AIzaSyDRSJdwoV5jvL4e4dyv963_JW0xybmMsCM",
    //   appId: "1:720996921239:android:d6aca3543400f0105d1ed2",
    //   messagingSenderId: "72000996921239",
    //   projectId: "ramadan-planner-aa105",
    //   storageBucket: "ramadan-planner-aa105.appspot.com",
    // ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      ),
      home: const SplashScreen(),
    );
  }
}
// ignore_for_file: prefer_const_constructors
import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/splash/splash_screen.dart';

List<CameraDescription>? cameras;
bool? seenOnboard;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
//initializeFirebase
  await Firebase.initializeApp();

  //   await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  //load to camera
  cameras = await availableCameras();

  // to load onboard for the first time only
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pakistan Currency Scanning & Detection App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: globalColors.primaryColor),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

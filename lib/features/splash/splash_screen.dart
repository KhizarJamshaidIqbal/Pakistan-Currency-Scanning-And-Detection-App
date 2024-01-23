// ignore_for_file: must_be_immutable, library_private_types_in_public_api, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pcsd_app/constants/colors.dart';
import '../../main.dart';
import '../../share/custom bottom navigation bar/custom_bottom_navigation_bar.dart';
import '../Onboarding/on_boarding_Screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => seenOnboard == true
                    ? BottomNavigationbar()
                    : OnboardingScreen())));
    // Timer(const Duration(seconds: 3), () {
    //   Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(builder: (context) => HomeScreen()),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(gradient: globalColors.primaryGradient),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [SvgPicture.asset('assets/images/MP.svg')],
            )));
  }
}

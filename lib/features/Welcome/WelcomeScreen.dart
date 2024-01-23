// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pcsd_app/constants/app_size.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/widgets/custom_Text_Widget.dart';
import 'package:pcsd_app/widgets/rounded_btn.dart';

import '../../share/custom bottom navigation bar/custom_bottom_navigation_bar.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: globalColors.primaryGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              90.h,
              const CustomText(
                  text: 'Welcome to the Currency Scanning\nAnd Detection App!',
                  color: globalColors.TitleColor,
                  fontsize: 18,
                  fontWeight: FontWeight.bold),
              10.h,
              const CustomText(
                  text:
                      'With a simple scan, you can verify your currency notes.  Say goodbye to Fake currency and secure your financial transactions with confidence.',
                  color: globalColors.DescriptionColor,
                  fontsize: 14,
                  fontWeight: FontWeight.w500),
              const Spacer(),
              Center(
                child: Lottie.asset(
                  "assets/images/welcome.json",
                  width: 340,
                  height: 340,
                  fit: BoxFit.cover,
                ),
              ),
              const Spacer(),
              const CustomText(
                  text:
                      'By clicking on Next, you agree to PCS&D Terms and \nConditions of Use.',
                  color: globalColors.DescriptionColor,
                  fontsize: 13,
                  fontWeight: FontWeight.w500),
              12.h,
              RoundButton(
                title: "Continue",
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationbar(),
                      ));
                },
              ),
              const SizedBox(height: 30),
              30.h,
            ],
          ),
        ),
      ),
    );
  }
}

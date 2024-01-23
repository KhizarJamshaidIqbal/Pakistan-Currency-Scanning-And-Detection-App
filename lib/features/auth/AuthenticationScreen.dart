// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pcsd_app/constants/app_size.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/features/Welcome/WelcomeScreen.dart';
import 'package:pcsd_app/features/auth/Register.dart';
import 'package:pcsd_app/widgets/custom_Text_Widget.dart';
import '../../widgets/line.dart';
import '../../widgets/rounded_btn.dart';
import '../../widgets/rounded_btn_with_Icon.dart';
import 'Login.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: globalColors.primaryGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  50.h,
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomeScreen(),
                            ));
                      },
                      child: CustomText(
                        text: 'Continue as a Guest',
                        color: globalColors.TitleColor,
                        fontsize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Literata-SemiBold',
                      ),
                    ),
                  ),
                  40.h,
                  CustomText(
                    text: 'Register Your Self',
                    color: globalColors.TitleColor,
                    fontsize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Literata-SemiBold',
                  ),
                  5.h,
                  const CustomText(
                    text: 'Become a member of our community.',
                    color: globalColors.TitleColor,
                    fontsize: 15,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Literata-SemiBold',
                  ),
                  const Spacer(),
                  Center(
                    child: Lottie.asset(
                      "assets/images/security.json",
                      width: 340,
                      height: 340,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  5.h,
                  RoundButtonWithIcon(
                    image: 'assets/images/Google.jpg',
                    title: 'Continue with Google',
                    onpress: () {},
                  ),
                  10.h,
                  RoundButtonWithIcon(
                    image: 'assets/images/Facebook.jpg',
                    title: 'Continue with Facebook',
                    onpress: () {},
                  ),
                  20.h,
                  line(),
                  20.h,
                  Center(
                    child: RoundButton(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ));
                      },
                      title: 'SignUp with Email',
                    ),
                  ),
                  10.h,
                  Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      child: const CustomText(
                          text: 'I already have an account',
                          color: globalColors.TitleColor,
                          fontsize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Literata-SemiBold',
                          textDecoration: TextDecoration.underline),
                    ),
                  ),
                  20.h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

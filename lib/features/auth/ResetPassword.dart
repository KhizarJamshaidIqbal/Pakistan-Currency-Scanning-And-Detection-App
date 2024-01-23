// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names, unused_element, prefer_const_constructors_in_immutables, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pcsd_app/constants/app_size.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/constants/fonts.dart';
import 'package:pcsd_app/widgets/custom_Text_Widget.dart';
import 'package:pcsd_app/widgets/rounded_btn.dart';
import '../../widgets/CustomLinearProgressIndicator.dart';
import '../../widgets/CustomPasswordInputField.dart';
import '../../widgets/custom_textField.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController EmailController = new TextEditingController();

  final TextEditingController CreateNewPasswordController =
      new TextEditingController();

  final TextEditingController ConfirmPasswordController =
      new TextEditingController();

  double progressValue = 0.5;

  void _GOBack() {
    setState(() {
      if (progressValue == 1) {
        progressValue = 0.5;
      } else {
        Navigator.pop(context);
      }
    });
  }

  void _continue() {
    setState(() {
      if (progressValue == 0.5) {
        progressValue = 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.SecondaryColor,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 1,
        decoration: const BoxDecoration(gradient: globalColors.primaryGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.h,
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          _GOBack();
                        },
                        child: const Icon(
                          Icons.arrow_back,
                          size: 35,
                          color: globalColors.TitleColor,
                        ),
                      ),
                      const Spacer(),
                      CoustomLinearProgressIndicator(
                        value: progressValue == 0.5 ? 0.5 : 1,
                      ),
                      const Spacer(),
                    ],
                  ),
                  40.h,
                  progressValue == 0.5
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Enter Your Email Address',
                              color: globalColors.TitleColor,
                              fontsize: 26,
                              fontFamily: fonts.fontfamily_4,
                              fontWeight: FontWeight.bold,
                            ),
                            5.h,
                            CustomText(
                              text:
                                  'Enter your Email Address to continue to the Pakistan Currency Scanning and Detection App',
                              color: globalColors.DescriptionColor,
                              fontsize: 14,
                              fontFamily: fonts.fontfamily_1,
                              fontWeight: FontWeight.bold,
                            ),
                            55.h,
                            RoundedTextField(
                              hintText: 'Type Email Address here...',
                              labelText: 'Email Address',
                              icon: Icon(
                                Icons.email_outlined,
                                color: globalColors.TitleColor,
                                size: 28,
                              ),
                              controller: EmailController,
                              inputType: TextInputType.emailAddress,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: 'Create New Password',
                              color: globalColors.TitleColor,
                              fontsize: 26,
                              fontFamily: fonts.fontfamily_4,
                              fontWeight: FontWeight.bold,
                            ),
                            5.h,
                            CustomText(
                              text:
                                  'Your new password must be different from the previous one',
                              color: globalColors.DescriptionColor,
                              fontsize: 14,
                              fontFamily: fonts.fontfamily_1,
                              fontWeight: FontWeight.bold,
                            ),
                            55.h,
                            CustomPasswordInputField(
                              controller: CreateNewPasswordController,
                              hintText: 'Enter new password',
                              labelText: 'Create your New Password',
                            ),
                            20.h,
                            CustomPasswordInputField(
                              controller: CreateNewPasswordController,
                              hintText: 'Enter new password',
                              labelText: 'Confirm Your Password',
                            ),
                          ],
                        ),
                  const Spacer(),
                  RoundButton(
                      title: progressValue == 0.5
                          ? 'Verify Email Address'
                          : 'Reset Password',
                      onPress: () {
                        _continue();
                      }),
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

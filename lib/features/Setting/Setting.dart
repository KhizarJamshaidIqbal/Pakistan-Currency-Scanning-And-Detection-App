// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pcsd_app/constants/app_size.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/widgets/custom_Text_Widget.dart';
import 'package:pcsd_app/widgets/line.dart';

import '../../share/custom bottom navigation bar/custom_bottom_navigation_bar.dart';
import '../../widgets/CustomAppbar.dart';
import '../auth/AuthenticationScreen.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        40.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomText(
            text: 'More Settings',
            color: globalColors.WhiteColor,
            fontsize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        40.h,
        Column(
          children: [
            line2(color: globalColors.WhiteColor),
            20.h,
            Row(
              children: [
                40.w,
                SvgPicture.asset(
                  'assets/images/profile.svg',
                ),
                20.w,
                CustomText(
                  text: 'My Profile',
                  color: globalColors.WhiteColor,
                  fontsize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
            20.h,
            line2(color: globalColors.WhiteColor),
          ],
        ),
        Column(
          children: [
            20.h,
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AuthenticationScreen(),
                    ));
              },
              child: Row(
                children: [
                  40.w,
                  SvgPicture.asset(
                    'assets/images/delete.svg',
                    color: Colors.red,
                  ),
                  20.w,
                  CustomText(
                    text: 'Delete Account',
                    color: Colors.red,
                    fontsize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
            20.h,
            line2(color: globalColors.WhiteColor),
          ],
        ),
      ],
    );
  }
}

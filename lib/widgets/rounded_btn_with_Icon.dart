// ignore_for_file: unnecessary_new, unused_import, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pcsd_app/constants/app_size.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/widgets/custom_Text_Widget.dart';

class RoundButtonWithIcon extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onpress;
  const RoundButtonWithIcon(
      {super.key,
      required this.image,
      required this.title,
      required this.onpress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpress,
      child: Container(
        height: 44,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              color: globalColors.primaryColor,
              width: 1.7,
            )),
        child: Row(
          children: [
            15.w,
            SizedBox(height: 34, width: 34, child: Image.asset(image)),
            // new SvgPicture.asset(
            //   'assets/images/GG.svg',
            //   allowDrawingOutsideViewBox: true,
            // ),
            20.w,
            CustomText(
              text: title,
              color: globalColors.TitleColor,
              fontsize: 20,
              fontFamily: 'Literata-SemiBold',
              fontWeight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}

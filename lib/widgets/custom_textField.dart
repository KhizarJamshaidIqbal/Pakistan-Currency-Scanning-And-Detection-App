// ignore_for_file: must_be_immutable, file_names, prefer_const_constructors

import 'package:pcsd_app/constants/app_size.dart';
import 'package:flutter/material.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/constants/fonts.dart';
import 'package:pcsd_app/widgets/custom_Text_Widget.dart';

class RoundedTextField extends StatelessWidget {
  final String labelText, hintText;
  bool? isOptional;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final Icon icon;

  final String? Function(String?)? validator;

  RoundedTextField({
    super.key,
    required this.labelText,
    this.isOptional = false,
    this.hintText = "",
    this.inputType,
    this.controller,
    this.icon = const Icon(Icons.person_outline),
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              text: labelText,
              color: globalColors.TitleColor,
              fontsize: 18,
              fontFamily: fonts.fontfamily_1,
            ),
            10.w,
            CustomText(
              text: "*",
              color: globalColors.RedColor,
              fontsize: 18,
              fontFamily: fonts.fontfamily_1,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        15.h,
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          validator: validator,
          style: TextStyle(
            color: Colors.white,
            fontFamily: fonts.fontfamily_4,
          ),
          decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hintText,
            hintStyle: TextStyle(
              color: globalColors.TitleColor,
              fontFamily: fonts.fontfamily_4,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: globalColors.TitleColor),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          ),
          cursorColor: Colors.white,
          cursorWidth: 2.0,
          cursorHeight: 20.0,
        ),
      ],
    );
  }
}

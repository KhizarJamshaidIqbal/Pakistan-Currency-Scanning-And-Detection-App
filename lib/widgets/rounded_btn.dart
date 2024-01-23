// // ignore_for_file: must_be_immutable
// ignore_for_file: must_be_immutable, use_super_parameters, unused_import

import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:flutter/material.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'custom_Text_Widget.dart';

class RoundButton extends StatelessWidget {
  final String title;
  bool loading;
  final VoidCallback onPress;

  RoundButton({
    Key? key,
    required this.title,
    this.loading = false,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: loading ? null : onPress,
        style: ElevatedButton.styleFrom(
          backgroundColor: globalColors.SecondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: globalColors.primaryColor,
            width: 1,
          ),
          // minimumSize: const Size.fromHeight(55),
        ),
        child: loading
            ? LoadingAnimationWidget.staggeredDotsWave(
                color: Colors.white,
                size: 50,
              )
            : Center(
                child: CustomText(
                  text: title,
                  color: globalColors.WhiteColor,
                  fontsize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
      ),
    );
  }
}

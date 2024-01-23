// ignore_for_file: file_names, prefer_const_constructors, camel_case_types, use_key_in_widget_constructors, override_on_non_overriding_member, override_on_non_overriding_member, unused_field, unused_local_variable, non_constant_identifier_names, no_leading_underscores_for_local_identifiers, use_super_parameters, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:pcsd_app/constants/colors.dart';

import '../features/Dashboard/HomeScreen.dart';
import '../features/Setting/Setting.dart';

//CustomHomeScreenAppbar
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    var _CurrentIndex = 0;
    var ScreenList = [
      HomeScreen(),
      Center(
        child: Text('Scanning'),
      ),
      Setting(),
    ];
    return AppBar(
      centerTitle: true,
      iconTheme: IconThemeData(color: globalColors.WhiteColor),
      title: Text(
        "Pakistan Currency Scanning and Detection",
        style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: "Inter",
            color: globalColors.WhiteColor),
      ),
      elevation: 0.9,
      backgroundColor: globalColors.primaryColor,
    );
  }
}

//CustomSettingScreenAppbar
class MyCustomAppBar extends StatelessWidget {
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.large(
      backgroundColor: Color(0xff1F8536),
      elevation: 0.0,
      centerTitle: true,
      iconTheme: IconThemeData(color: globalColors.WhiteColor),
      title: Text(
        "More Settings",
        style: TextStyle(
          color: globalColors.WhiteColor,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_final_fields, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../features/Dashboard/HomeScreen.dart';
import '../../features/Scanner/scanner.dart';
import '../../features/Setting/Setting.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/CustomDrawer.dart';

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int _currentindex = 0;

  var ScreenList = [
    HomeScreen(),
    Scanner(),
    Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      drawer: CustomDrawer(user: FirebaseAuth.instance.currentUser),
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: globalColors.primaryGradient,
          ),
          child: ScreenList[_currentindex]),
      extendBody: true,
      backgroundColor: globalColors.SecondaryColor,
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
        child: Theme(
          data: ThemeData(
            canvasColor: globalColors.SecondaryColor,
          ),
          child: BottomNavigationBar(
            backgroundColor: globalColors.primaryColor,
            selectedItemColor: globalColors.SecondaryColor,
            unselectedItemColor: globalColors.WhiteColor,
            showUnselectedLabels: true,
            items: [
              BottomNavigationBarItem(
                icon: _currentindex == 0
                    ? SvgPicture.asset('assets/images/SelectedHome.svg')
                    : SvgPicture.asset('assets/images/UnSelectedHome.svg'),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _currentindex == 1
                    ? SvgPicture.asset('assets/images/SelectedScanner.svg')
                    : SvgPicture.asset('assets/images/UnSelectedScanner.svg'),
                label: 'Scanning',
              ),
              BottomNavigationBarItem(
                icon: _currentindex == 2
                    ? SvgPicture.asset('assets/images/UnSsettings.svg')
                    : SvgPicture.asset('assets/images/Ssettings.svg'),
                label: 'Setting',
              ),
            ],
            currentIndex: _currentindex,
            onTap: (value) {
              setState(() {
                _currentindex = value;
              });
            },
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print, deprecated_member_use, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pcsd_app/constants/app_size.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/features/auth/Login.dart';
import 'package:pcsd_app/widgets/CustomSnackbar.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/privacypolicy.dart';
import 'line.dart';

class CustomDrawer extends StatelessWidget {
  final User? user;
  CustomDrawer({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    Future<void> _launchURL(String url) async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    Widget drawerHeader;

    if (user != null) {
      String initial = user!.displayName?.isNotEmpty == true
          ? user!.displayName![0].toUpperCase()
          : 'A';
      drawerHeader = UserAccountsDrawerHeader(
        accountEmail: Text(user!.email ?? ''),
        accountName: Text(user!.displayName ?? ''),
        currentAccountPicture: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          child: Text(
            initial,
            style: TextStyle(
              color: Color.fromARGB(255, 37, 182, 9),
              fontSize: 24,
            ),
          ),
        ),
      );
    } else {
      drawerHeader = DrawerHeader(
        decoration: BoxDecoration(gradient: globalColors.primaryGradient),
        child: SvgPicture.asset("assets/images/PCSAD_Logo.svg"),
      );
    }
    return Drawer(
      surfaceTintColor: globalColors.WhiteColor,
      clipBehavior: Clip.none,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          drawerHeader,
          Column(
            children: [
              5.h,
              ListTile(
                title: const Text(
                  'Share',
                  style: TextStyle(
                      color: globalColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                      height: 25,
                      width: 20,
                      child: SvgPicture.asset("assets/images/Share.svg")),
                ),
                onTap: () async {
                  try {
                    Share.share(
                        "https://play.google.com/store/apps/details?id=com.sharasol.PKR_Fake_Check_Guide");
                  } catch (e) {
                    print(e.toString());
                  }
                },
              ),
              line2(),
              ListTile(
                title: const Text(
                  'Rate Us',
                  style: TextStyle(
                      color: globalColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                      height: 25,
                      width: 20,
                      child: SvgPicture.asset("assets/images/Rate_us.svg")),
                ),
                onTap: () {
                  StoreRedirect.redirect(
                    androidAppId: "com.sharasol.PKR_Fake_Check_Guide",
                  );
                },
              ),
              line2(),
              ListTile(
                title: const Text(
                  'More Apps',
                  style: TextStyle(
                      color: globalColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                      height: 25,
                      width: 20,
                      child:
                          SvgPicture.asset("assets/images/More_Apps_Icon.svg")),
                ),
                onTap: () {
                  _launchURL(
                      "https://play.google.com/store/apps/dev?id=8994386378575122109&hl=en_IN");
                },
              ),
              line2(),
              ListTile(
                title: const Text(
                  'Feedback',
                  style: TextStyle(
                      color: globalColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                      height: 25,
                      width: 20,
                      child: SvgPicture.asset("assets/images/Feedback.svg")),
                ),
                onTap: () {
                  launch('mailto:21101001-058@uskt.edu.pk');
                },
              ),
              line2(),
              ListTile(
                title: const Text(
                  'Privacy Policy',
                  style: TextStyle(
                      color: globalColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                      height: 25,
                      width: 20,
                      child:
                          SvgPicture.asset("assets/images/PrivacyPolicy.svg")),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPolicy(),
                      ));
                },
              ),
              line2(),
              30.h,
              ListTile(
                title: const Text(
                  'Report',
                  style: TextStyle(
                      color: globalColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                      height: 25,
                      width: 20,
                      child: SvgPicture.asset("assets/images/Report.svg")),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PrivacyPolicy(),
                      ));
                },
              ),
              ListTile(
                title: const Text(
                  'Lagout',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter"),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                      height: 25,
                      width: 20,
                      child: SvgPicture.asset("assets/images/Lagout.svg")),
                ),
                onTap: () {
                  CustomSnackbar.show(context, 'Lagout',
                      backgroundColor: Colors.red);
                  FirebaseAuth.instance.signOut();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ));
                },
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Container(
                    height: 1,
                    width: 120,
                    color: globalColors.primaryColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Version ",
                        style: TextStyle(
                            fontSize: 18,
                            color: globalColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Inter"),
                      ),
                      Text(
                        "1.0.0+1",
                        style: TextStyle(
                            fontSize: 12,
                            color: globalColors.primaryColor,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Inter"),
                      )
                    ],
                  ),
                  Container(
                    height: 1,
                    width: 120,
                    color: globalColors.primaryColor,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

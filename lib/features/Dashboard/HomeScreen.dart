// ignore_for_file: prefer_const_constructors, sort_child_properties_last, file_names, unused_element, non_constant_identifier_names, unused_import, unused_field, prefer_final_fields, prefer_const_literals_to_create_immutables, avoid_print, deprecated_member_use, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/features/Dashboard/PNI.dart';
import 'package:share_plus/share_plus.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/privacypolicy.dart';
import '../../models/static_PNI.dart';
import '../../widgets/CustomAppbar.dart';
import '../../widgets/CustomDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  dynamic list = Pakistan_Note_api.PNI_data;

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: globalColors.primaryGradient),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: list.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 5),
                    child: InkWell(
                      onTap: (() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PNI_details(
                                imgeUrl: list[index]["PNI_Images"],
                                Title: list[index]["RS"],
                                initialIndex: index,
                              ),
                            ));
                      }),
                      child: SizedBox(
                        width: double.infinity,
                        height: 170,
                        child: Image.asset(
                          "${list[index]["thumbnailUrl"]}",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

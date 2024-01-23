// ignore_for_file: file_names, unused_local_variable, prefer_final_fields, use_super_parameters, prefer_const_constructors, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pcsd_app/constants/app_size.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/models/onboardingscreen_components.dart';
import 'package:pcsd_app/widgets/custom_Text_Widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
import '../auth/AuthenticationScreen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  PageController _pageController = PageController(initialPage: 0);

  Future setSeenonboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    seenOnboard = await prefs.setBool('seenOnboard', true);
  }

  @override
  void initState() {
    super.initState();
    setSeenonboard();
  }

  void _navigateToNext() {
    if (currentPage < onboarding_data.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {}
  }

  void _navigateToBack() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(gradient: globalColors.primaryGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboarding_data.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        55.h,
                        currentPage < 1
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AuthenticationScreen(),
                                          ));
                                    },
                                    child: CustomText(
                                        text: 'Skip',
                                        color: globalColors.WhiteColor,
                                        fontsize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          globalColors.primaryColor,
                                      radius: 18,
                                      child: IconButton(
                                          onPressed: () {
                                            _navigateToBack();
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios_rounded,
                                            size: 20,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                AuthenticationScreen(),
                                          ));
                                    },
                                    child: CustomText(
                                        text: 'Skip',
                                        color: globalColors.WhiteColor,
                                        fontsize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                        50.h,
                        CustomText(
                            text: onboarding_data[index].title,
                            color: globalColors.TitleColor,
                            fontsize: 18,
                            fontWeight: FontWeight.bold),
                        10.h,
                        CustomText(
                            text: onboarding_data[index].Description,
                            color: globalColors.DescriptionColor,
                            fontsize: 14,
                            fontWeight: FontWeight.w400),
                        Spacer(),
                        Lottie.asset(
                          onboarding_data[index].image,
                          width: 340,
                          height: 340,
                          fit: BoxFit.cover,
                        ),
                        Spacer(),
                      ],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboarding_data.length,
                      (index) => AnimatedContainer(
                        margin: const EdgeInsets.only(right: 5.0),
                        duration: const Duration(milliseconds: 500),
                        height: 10,
                        width: currentPage == index ? 25 : 10,
                        decoration: BoxDecoration(
                          color: currentPage == index
                              ? globalColors.primaryColor
                              : globalColors.WhiteColor,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(60)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      currentPage > 1
                          ? Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthenticationScreen()),
                            )
                          : _navigateToNext();
                    },
                    child: Container(
                      height: 50,
                      width: 125,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          border: Border.all(color: globalColors.WhiteColor)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            CustomText(
                              text: 'Next',
                              color: globalColors.WhiteColor,
                              fontsize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.arrow_forward_ios_sharp,
                                color: globalColors.WhiteColor),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              30.h
            ],
          ),
        ),
      ),
    );
  }
}

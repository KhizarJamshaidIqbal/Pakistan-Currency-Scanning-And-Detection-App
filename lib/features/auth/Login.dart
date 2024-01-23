// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, non_constant_identifier_names, must_be_immutable, unused_field, override_on_non_overriding_member, prefer_const_constructors_in_immutables, avoid_print, use_build_context_synchronously, unused_element

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pcsd_app/constants/app_size.dart';
import 'package:pcsd_app/constants/colors.dart';
import 'package:pcsd_app/constants/fonts.dart';
import 'package:pcsd_app/features/Welcome/WelcomeScreen.dart';
import 'package:pcsd_app/features/auth/ResetPassword.dart';
import 'package:pcsd_app/features/auth/auth.dart';
import 'package:pcsd_app/widgets/custom_Text_Widget.dart';
import 'package:pcsd_app/widgets/rounded_btn.dart';
import '../../widgets/CustomPasswordInputField.dart';
import '../../widgets/CustomSnackbar.dart';
import '../../widgets/custom_textField.dart';
import '../../widgets/line.dart';
import '../../widgets/rounded_btn_with_Icon.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isSigning = false;

  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController EmailController = new TextEditingController();

  final TextEditingController PasswordController = new TextEditingController();

  @override
  void dispose() {
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: globalColors.SecondaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1,
            decoration:
                const BoxDecoration(gradient: globalColors.primaryGradient),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  60.h,
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 35,
                      color: globalColors.TitleColor,
                    ),
                  ),
                  40.h,
                  CustomText(
                    text: 'Sign In',
                    color: globalColors.TitleColor,
                    fontsize: 20,
                    fontFamily: fonts.fontfamily_1,
                    fontWeight: FontWeight.bold,
                  ),
                  5.h,
                  CustomText(
                    text:
                        'Welcome Back!\nPlease enter your credentials to continue.',
                    color: globalColors.DescriptionColor,
                    fontsize: 14,
                    fontFamily: fonts.fontfamily_1,
                    fontWeight: FontWeight.bold,
                  ),
                  35.h,
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
                  20.h,
                  CustomPasswordInputField(
                    controller: PasswordController,
                    hintText: 'Enter new password here...',
                    labelText: 'Password',
                  ),
                  10.h,
                  Row(
                    children: [
                      const Spacer(),
                      const CustomText(
                        text: 'Forget your password?',
                        color: globalColors.TitleColor,
                        fontsize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Literata-SemiBold',
                      ),
                      5.w,
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResetPassword(),
                              ));
                        },
                        child: const CustomText(
                            text: 'Reset Password',
                            color: globalColors.TitleColor,
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: fonts.fontfamily_1,
                            textDecoration: TextDecoration.underline),
                      ),
                      const Spacer(),
                    ],
                  ),
                  30.h,
                  line(),
                  30.h,
                  RoundButtonWithIcon(
                    image: 'assets/images/Google.jpg',
                    title: 'Continue with Google',
                    onpress: () {},
                  ),
                  10.h,
                  RoundButtonWithIcon(
                    image: 'assets/images/Facebook.jpg',
                    title: 'Continue with Facebook',
                    onpress: () {},
                  ),
                  const Spacer(),
                  RoundButton(
                      title: 'Continue',
                      loading: _isSigning,
                      onPress: () {
                        _signIn();
                      }),
                  10.h,
                  Row(
                    children: [
                      const Spacer(),
                      const CustomText(
                        text: 'Don’t have an account?',
                        color: globalColors.TitleColor,
                        fontsize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Literata-SemiBold',
                      ),
                      5.w,
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ));
                        },
                        child: const CustomText(
                            text: 'Sign Up',
                            color: globalColors.TitleColor,
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: fonts.fontfamily_1,
                            textDecoration: TextDecoration.underline),
                      ),
                      const Spacer(),
                    ],
                  ),
                  20.h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    setState(() {
      _isSigning = true;
    });

    String email = EmailController.text;
    String password = PasswordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    setState(() {
      _isSigning = false;
    });

    if (user != null) {
      print("Successfully SignUp Pakistan Curency Scanning And Detection App");
      CustomSnackbar.show(context, 'Sign-In successful',
          backgroundColor: Colors.green);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ));
    } else {
      print("Some Error occurs");
      CustomSnackbar.show(context, 'Error during sign-up',
          backgroundColor: Colors.red);
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:movie_ticket_booging/core/utils/theme_changer.dart';

import 'package:movie_ticket_booging/futures/auth/logic/sign_in_with_google.dart';

import 'package:movie_ticket_booging/futures/auth/logic/facebook_controller.dart';

import 'package:movie_ticket_booging/futures/auth/screens/confirm_otp.dart';
import 'package:movie_ticket_booging/futures/home/screens/home_page.dart';
import 'package:movie_ticket_booging/shared/widgets/custom_buttom.dart';
import 'package:movie_ticket_booging/shared/widgets/custom_socalmedia_buttom.dart';

import '../../home/widget/custom_bottom_navigation_bar.dart';

class SingIn extends StatefulWidget {
  const SingIn({super.key});

  @override
  State<SingIn> createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  ThemeChanger _themeController = Get.put(ThemeChanger());

  FacebookLogic facebookController = Get.put(FacebookLogic());
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          "sign_in".tr,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "username".tr,
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                  ),
                  // controller: ,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "enter_your_username".tr;
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    hintText: "7045550127".tr,
                    prefixIcon: Icon(Icons.phone, size: 20),
                  ),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "number_required".tr;
                    } else if (!RegExp(r'^[0-9]{7,15}$').hasMatch(value)) {
                      return "valid_phone_number".tr;
                    } else {
                      return null;
                    }
                  },
                ),


                SizedBox(height: screenHeight * 0.05),
                CustomButton(
                  buttonText: "continue".tr,
                  color: Color(0xffFCC434),
                  onPressed: () {
                    Get.to(ConfirmOtp());
                  },
                  textColor: Colors.black,
                ),
                SizedBox(height: screenHeight * 0.18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: screenWidth * 0.24,
                      height: screenHeight * 0.002,
                      color:
                          _themeController.isDarkMode == false
                              ? Colors.black
                              : Colors.white,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Text(
                      "or_continue_with".tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    Container(
                      width: screenWidth * 0.24,
                      height: screenHeight * 0.002,
                      color:
                          _themeController.isDarkMode == false
                              ? Colors.black
                              : Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomSocialButton(
                  imagePath: "assets/images/facebook.png",
                  text: "facebook".tr,

                  onPressed: () {
                    facebookController.login();

             ),


              SizedBox(height: screenHeight * 0.02),
              CustomSocialButton(
                imagePath: "assets/images/google.png",
                text: "google".tr,
                onPressed: () {gotoGoolgeSignIn();},
              ),
              SizedBox(height: screenHeight * 0.03),
              Text(
                textAlign: TextAlign.center,
                "privacy_policy".tr,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFB3B3B3),

                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                width: 153,
                height: 5,
                color:
                    _themeController.isDarkMode == false
                        ? Colors.black
                        : Colors.white,
              ),

                SizedBox(height: screenHeight * 0.02),
                CustomSocialButton(
                  imagePath: "assets/images/google.png",
                  text: "google".tr,
                  onPressed: () {},
                ),
                SizedBox(height: screenHeight * 0.03),
                Text(
                  textAlign: TextAlign.center,
                  "privacy_policy".tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFB3B3B3),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  height: screenHeight * 0.003,
                  width: screenWidth * 0.4,
                  color:
                      _themeController.isDarkMode == false
                          ? Colors.black
                          : Colors.white,
                ),

  ])
          ),
        ),
      ),
    );
  }
  void gotoGoolgeSignIn()async{
    final userCredential = await SignInWithGoogle.signInWithGoogle();

    if (userCredential != null) {
     Get.to(CustomBottomNavigationBar());
  }}

}

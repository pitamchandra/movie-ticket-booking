import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/core/utils/theme_changer.dart';
import 'package:movie_ticket_booging/futures/auth/screens/sign_up.dart';
import 'package:movie_ticket_booging/shared/widgets/custom_buttom.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  ThemeChanger themeController = Get.put(ThemeChanger());
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 20, left: 20, top: 20),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  height: 50,
                  width: 240,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: screenWidth * 0.01),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.white),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("english".tr),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Sign-in.png",
                  height: 330,
                  width: 330,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "mBooking_hello!".tr,
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  "enjoy_your_favorite_movies".tr,
                  style: TextStyle(fontSize: 21),
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomButton(
                  buttonText: "sign_in".tr,
                  color: Color(0xffFCC434),
                  onPressed: () {},
                  textColor: Colors.black,
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomButton(
                  buttonText: "sign_up".tr,
                  color: Colors.black,
                  onPressed: () {
                    Get.to(SignUP());
                  },
                  textColor: Colors.white,
                ),
                SizedBox(height: screenHeight * 0.03),
                Center(
                  child: Text(
                    "privacy_policy".tr,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(width: 153, height: 5, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

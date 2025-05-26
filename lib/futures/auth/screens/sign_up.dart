import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/auth/screens/confirm_otp.dart';
import 'package:movie_ticket_booging/shared/widgets/custom_buttom.dart';
import 'package:movie_ticket_booging/shared/widgets/custom_socalmedia_buttom.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  var isCheck = false.obs;
  bool obscureText = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
          "sign_up".tr,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.05),
            Form(
              key: _formKey,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "(704) 555-0127",
                  prefixIcon: Icon(Icons.phone),
                ),
                keyboardType: TextInputType.number,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Phone number is required";
                  } else if (!RegExp(r'^[0-9]{7,15}$').hasMatch(value)) {
                    return "Please enter a valid phone number (7-15 digits)";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            CustomButton(
              buttonText: "continue".tr,
              color: Color(0xffFCC434),
              onPressed: () {
                Get.to(ConfirmOtp());
              },
              textColor: Colors.black,
            ),
            SizedBox(height: screenHeight * 0.28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(width: 116, height: 1, color: Colors.white),
                SizedBox(width: 5),
                Text("or_continue_with".tr, style: TextStyle(fontSize: 16)),
                SizedBox(width: 5),
                Container(width: 116, height: 1, color: Colors.white),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomSocialButton(
              imagePath: "assets/images/facebook.png",
              text: "facebook".tr,
              onPressed: () {},
            ),

            SizedBox(height: screenHeight * 0.02),
            CustomSocialButton(
              imagePath: "assets/images/google.png",
              text: "google".tr,
              onPressed: () {},
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
      ),
    );
  }
}

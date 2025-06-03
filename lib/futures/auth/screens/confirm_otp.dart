import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/core/utils/theme_changer.dart';
import 'package:movie_ticket_booging/futures/auth/screens/username.dart';
import 'package:movie_ticket_booging/shared/widgets/custom_buttom.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ConfirmOtp extends StatefulWidget {
  const ConfirmOtp({super.key});

  @override
  State<ConfirmOtp> createState() => _ConfirmOtpState();
}

class _ConfirmOtpState extends State<ConfirmOtp> {
  ThemeChanger _themeController = Get.put(ThemeChanger());
  bool hasError = false;
  String currentText = "";
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
          icon: Icon(Icons.arrow_back, size: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                "confirm_otp_code".tr,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffFCC434),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "otp_details".tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFB3B3B3),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
                length: 6,
                obscureText: false,
                //  obscuringCharacter: '*',
                // obscuringWidget: const FlutterLogo(
                //   size: 24,
                // ),
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v!.length < 6) {
                    return "I'm from validator";
                  } else {
                    return null;
                  }
                },
                pinTheme: PinTheme(
                  borderWidth: 2,
                  activeColor: Color(0xffFCC434),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),

                  fieldHeight: 72,
                  fieldWidth: 52,
                  activeFillColor: Colors.black,
                ),
                cursorColor: Colors.white,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                //errorAnimationController: ,
                //controller: verifyController,
                keyboardType: TextInputType.multiline,
                // boxShadows: const [
                //   BoxShadow(
                //     offset: Offset(0, 1),
                //     color: Colors.black12,
                //     blurRadius: 10,
                //   )
                // ],
                onCompleted: (v) {
                  debugPrint("Completed");
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  debugPrint(value);
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
                  return true;
                },
              ),

              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "00.59",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: screenHeight * 0.2),
              CustomButton(
                buttonText: "continue".tr,
                color: Color(0xffFCC434),
                onPressed: () {
                  Get.to(Username());
                },
                textColor: Colors.black,
              ),

              SizedBox(height: screenHeight * 0.22),
              Center(
                child: Container(
                  height: screenHeight * 0.003,
                  width: screenWidth * 0.4,
                  color:
                      _themeController.isDarkMode == false
                          ? Colors.black
                          : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/core/utils/theme_changer.dart';
import 'package:movie_ticket_booging/futures/home/screens/home_page.dart';
import 'package:movie_ticket_booging/shared/widgets/custom_buttom.dart';

class Username extends StatefulWidget {
  const Username({super.key});

  @override
  State<Username> createState() => _UsernameState();
}

class _UsernameState extends State<Username> {
  ThemeChanger _themeController = Get.put(ThemeChanger());
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
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Text(
              "enter_username".tr,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: Color(0xffFCC434),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "lation_emoji_symbol".tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: screenHeight * 0.03),
            Form(
              key: _formKey,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(hintText: "Username"),
                keyboardType: TextInputType.multiline,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your username";
                  } else if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                    return "Please enter a valid userName";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.25),
            CustomButton(
              buttonText: "done".tr,
              color: Color(0xffFCC434),
              onPressed: () {
                Get.to(HomePage());
              },
              textColor: Colors.black,
            ),

            SizedBox(height: screenHeight * 0.25),
            Center(
              child: Container(
                width: 153,
                height: 5,
                color:
                    _themeController.isDarkMode == false
                        ? Colors.black
                        : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

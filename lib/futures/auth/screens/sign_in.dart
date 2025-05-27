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
  ThemeChanger _themeController = Get.put(ThemeChanger());
  final RxString selectedLanguage = 'english'.obs;
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
                    onPressed: () {
                      languageChangeBottomsheet(context, screenHeight);
                    },
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
                  height: 300,
                  width: 300,
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
                Container(
                  width: 153,
                  height: 5,
                  color:
                      _themeController.isDarkMode == false
                          ? Colors.black
                          : Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> languageChangeBottomsheet(
    BuildContext context,
    double screenHeight,
  ) {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: screenHeight * 0.5,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),
              Text(
                'choose_language'.tr,
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                'which_language_do_use'.tr,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              SizedBox(height: screenHeight * 0.01),
              LanguageTile(
                value: 'english',
                label: 'English',
                selectedLanguage: selectedLanguage,
              ),
              Divider(color: Colors.grey),
              LanguageTile(
                value: 'vietnamese',
                label: 'Vietnamese',
                selectedLanguage: selectedLanguage,
              ),
              SizedBox(height: screenHeight * 0.1),
              CustomButton(
                buttonText: "use_english".tr,
                color: Color(0xffFCC434),
                onPressed: () {},
                textColor: Colors.black,
              ),
            ],
          ),
        );
      },
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String value;
  final String label;
  final RxString selectedLanguage;
  final VoidCallback? onTap;

  const LanguageTile({
    super.key,
    required this.value,
    required this.label,
    required this.selectedLanguage,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      bool isSelected = selectedLanguage.value == value;

      return ListTile(
        title: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: isSelected ? Colors.amber : Colors.white,
          ),
        ),
        trailing: Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.amber : Colors.white,
              width: 2,
            ),
          ),
          child:
              isSelected
                  ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber,
                      ),
                    ),
                  )
                  : SizedBox(),
        ),
        onTap: () {
          selectedLanguage.value = value;
          if (onTap != null) {
            onTap!();
          }
        },
      );
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalDemo extends StatelessWidget {
  const PersonalDemo({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/profile.png",
          height: 90,
          width: 90,
          fit: BoxFit.cover,
        ),
        SizedBox(width: screenWidth * 0.01),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "angelina".tr,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Icon(Icons.phone, size: 20, color: Color(0xFFDEDEDE)),
                SizedBox(width: 10),
                Text(
                  "7045550127".tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFDEDEDE),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.email, size: 20, color: Color(0xFFDEDEDE)),
                SizedBox(width: 10),
                Text(
                  "angelina@example.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Color(0xFFDEDEDE),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: screenWidth * 0.01),
        InkWell(
          onTap: () {},
          child: Icon(Icons.drive_file_rename_outline, size: 24),
        ),
      ],
    );
  }
}

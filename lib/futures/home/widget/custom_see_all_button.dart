import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/details_page/screens/details_page.dart';

class CustomSeeAllButton extends StatelessWidget {
  String text;
  CustomSeeAllButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Text(
          "$text",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        Spacer(),
        Row(
          children: [
            InkWell(
              onTap: () {
                Get.to(DetailsPage());
              },
              child: Text("see_all".tr, style: TextStyle(color: Colors.amber)),
            ),
            SizedBox(width: width * 0.01),
            Icon(Icons.arrow_forward_ios, size: 15, color: Colors.amber),
          ],
        ),
      ],
    );
  }
}

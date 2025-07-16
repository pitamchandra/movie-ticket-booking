import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/details_page/screens/details_page.dart';

import '../../../core/constants/size_config.dart';

class CustomSeeAllButton extends StatelessWidget {
  String text;
  CustomSeeAllButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final bool isDesktop = width > 800;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: isDesktop? width*0.05:0),
      child: Row(
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
                child: Text("see_all".tr, style: TextStyle(color: Colors.amber, fontSize:isDesktop? width*0.01: width*0.03)),
              ),
              SizedBox(width: width * 0.01),
              Icon(Icons.arrow_forward_ios, size: 15, color: Colors.amber),
            ],
          ),
        ],
      ),
    );
  }
}

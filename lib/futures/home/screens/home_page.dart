import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/home_color.dart';
import '../widget/home_search_bar.dart';
import '../widget/home_tupper_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColor.backgroundColor(context),
      body: SafeArea(
        child: Column(
          children: [
            HomeTupperText(),
            HomeSearchBar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text("now_playing".tr,style: TextStyle(fontSize: 25 ,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text("see_all".tr,),
                    ],
                  ),
                  // PageView(children: [
                  //
                  // ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}





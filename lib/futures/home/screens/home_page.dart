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
  PageController _pageController = PageController();
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 150,
                    child: Obx(() => PageView.builder(
                      controller: _pageController,
                      itemCount: 4,
                      onPageChanged: (index) {
                        _homeController.currentPage.value = index;
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              ,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    )),
                  ),
                  const SizedBox(height: 8),
                  Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      ImageController.bannerImages.length,
                          (index) => AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        margin: EdgeInsets.symmetric(horizontal: 4),
                        width: _homeController.currentPage.value == index ? 12 : 8,
                        height: _homeController.currentPage.value == index ? 12 : 8,
                        decoration: BoxDecoration(
                          color: _homeController.currentPage.value == index
                              ? Colors.green
                              : Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  )),
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





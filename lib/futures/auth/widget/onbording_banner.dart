import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/auth/data/onbording_image.dart';
import 'package:movie_ticket_booging/futures/auth/logic/onbording_controller.dart';

class OnbordingBanner extends StatelessWidget {
  final OnbordingController onbordingController = Get.put(
    OnbordingController(),
  );

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GetBuilder<OnbordingController>(
            builder: (controller) {
              return SizedBox(
                width: screenWidth * 0.8,
                height: screenHeight * 0.53,
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: controller.loopedList.length,
                  onPageChanged: (index) {
                    controller.updatePage(index);
                  },
                  itemBuilder: (context, index) {
                    final movie = controller.loopedList[index];
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            movie['image']!,
                            width: screenWidth * 0.9,
                            height: screenHeight * 0.44,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // SizedBox(height: height * 0.01),
                        Text(
                          movie['name']!,
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          movie['title']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),

          GetBuilder<OnbordingController>(
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  OnbordingImage.onbordingplaylist.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: controller.currentPage == index ? 12 : 8,
                    height: controller.currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color:
                          controller.currentPage == index
                              ? Colors.amber
                              : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SizedBox(height: height * 0.01),
          GetBuilder<OnbordingController>(
            builder: (controller) {
              return SizedBox(
                width: width * 0.8,
                height: height * 0.47,
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
                            height: 330,
                            width: 330,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          movie['name']!,
                          style: TextStyle(
                            fontSize: 32,
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

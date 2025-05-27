import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/home/data/home_image.dart';
import 'package:movie_ticket_booging/futures/home/widget/custom_see_all_button.dart';

class CustomDiscountCort extends StatelessWidget {
  const CustomDiscountCort({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSeeAllButton(text: "discount".tr),
        SizedBox(
          height: height * 0.28, // একটু বেশি রাখলে safe
          child: PageView.builder(
            itemCount: HomeImage.palingMovieList.length,
            itemBuilder: (context, index) {
              final movie = HomeImage.palingMovieList[index];
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    movie['image']!,
                    width: width,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

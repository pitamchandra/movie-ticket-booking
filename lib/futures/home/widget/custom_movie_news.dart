import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../details_page/screens/details_page.dart';
import '../data/home_image.dart';
import 'custom_see_all_button.dart';

class CustomMovieNews extends StatelessWidget {
  const CustomMovieNews({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomSeeAllButton(text: "movie_news".tr),
        SizedBox(height: 10),
        SizedBox(
          height: height * 0.26,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: HomeImage.palingMovieList.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = HomeImage.palingMovieList[index];
              return GestureDetector(
                onTap: () {
                  goToDetailsPage(movie);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: width * 0.65,
                      height: height * 0.17,
                      margin: EdgeInsets.all(width * 0.02),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage("${movie['image']}"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "${movie['description']}".length > 30
                          ? "${movie['description']}".substring(0, 35)
                          : "${movie['description']}",
                      style: TextStyle(fontSize: 17),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Text(
                      "${movie['description']}".length > 30
                          ? "${movie['description']}".substring(36, 70)
                          : "${movie['description']}",
                      style: TextStyle(fontSize: 17),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void goToDetailsPage(movie) {
    Get.to(DetailsPage(movie: movie));
  }
}

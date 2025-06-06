import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/details_page/screens/details_page.dart';

import '../../../core/constants/size_config.dart';
import '../data/home_image.dart';
import '../logic/plaing_now_controller.dart';
import 'custom_see_all_button.dart';


class PlayingMoviePageView extends StatefulWidget {
  const PlayingMoviePageView({super.key});
  @override
  State<PlayingMoviePageView> createState() => _PlayingMoviePageViewState();
}


class _PlayingMoviePageViewState extends State<PlayingMoviePageView> {
  final PlayingMovieController _playingMovie = Get.find<PlayingMovieController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final bool isDesktop = width > 800;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(height: height * 0.01),
          CustomSeeAllButton(text: "now_playing".tr),
          SizedBox(height: height * 0.02),
          GetBuilder(
            init: _playingMovie,
            builder: (playingMovie) {
              return SizedBox(
                height:isDesktop? height * 0.8:height*0.7,
                child: PageView.builder(
                  controller:playingMovie.pageController,
                  itemCount: playingMovie.loopedList.length,
                  onPageChanged: (index) {
                    playingMovie.currentPage =
                        index % playingMovie.loopedList.length;
                  },
                  itemBuilder: (context, index) {
                    final movie = playingMovie.loopedList[index];
                    return InkWell(
                      onTap: (){
                        goToDetailsPage(movie);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                movie['image'],
                                height:isDesktop? height * 0.65: height * 0.5,
                                width:isDesktop? width * 0.55: double.infinity,

                                // loopedList[index],
                                // ✅ correct image path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "${movie['name']}",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${movie['description']}",
                            style: TextStyle(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StarRating(
                                rating: 1,
                                allowHalfRating: true,
                                starCount: 1,
                                color: Colors.amber,
                              ),
                              Text("${movie['rating']}"),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
          GetBuilder(
            init: _playingMovie,
            builder: (playingMovie) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  HomeImage.palingMovieList.length,
                  (index) => AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: playingMovie.currentPage == index ? 12 : 8,
                    height: playingMovie.currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color:
                          playingMovie.currentPage == index
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
  void goToDetailsPage(movie) {
    Get.to(DetailsPage(movie: movie,));
  }
}



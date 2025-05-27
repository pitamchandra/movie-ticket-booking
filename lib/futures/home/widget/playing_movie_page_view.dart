import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../data/home_image.dart';
import '../logic/plaing_now_controller.dart';

class PlayingMoviePageView extends StatefulWidget {
  const PlayingMoviePageView({
    super.key,

  });
  @override
  State<PlayingMoviePageView> createState() => _PlayingMoviePageViewState();
}

class _PlayingMoviePageViewState extends State<PlayingMoviePageView> {
  PlayingMovieController _playingMovie = Get.find<PlayingMovieController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child:Column(
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "now_playing".tr,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text("see_all".tr),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: 150,
              child: GetBuilder(
                  init: _playingMovie,
                  builder: (playingMovie) {
                    return PageView.builder(
                      controller: playingMovie.pageController, // ✅ controller use
                      itemCount: HomeImage.palingMovieList.length,
                      onPageChanged: (index) {
                        playingMovie.currentPage= index;
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              HomeImage.palingMovieList[index], // ✅ correct image path
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }
              ),
            ),
            const SizedBox(height: 8),
            GetBuilder(
                init: _playingMovie,
                builder: (playingMovie) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        HomeImage.palingMovieList.length,
                            (index) =>  AnimatedContainer(

                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: playingMovie.currentPage== index ? 12 : 8,
                          height: playingMovie.currentPage== index ? 12 : 8,
                          decoration: BoxDecoration(
                            color: playingMovie.currentPage == index
                                ? Colors.green
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        )
                    ),
                  );
                }
            ),
          ],
        )

    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playingMovie.startAutoScrollBanner();
  }
}
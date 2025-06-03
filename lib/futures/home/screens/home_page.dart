import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/size_config.dart';
import '../logic/home_color_controller.dart';
import '../logic/plaing_now_controller.dart';
import '../widget/custom_coming_soon_list_view.dart';
import '../widget/custom_discount_cort.dart';
import '../widget/custom_movie_news.dart';
import '../widget/custom_services.dart';
import '../widget/home_search_bar.dart';
import '../widget/home_tupper_text.dart';
import '../widget/playing_movie_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PlayingMovieController _playingMovie = Get.find<PlayingMovieController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColorController.backgroundColor(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HomeTupperText(),
              HomeSearchBar(),
              PlayingMoviePageView(),
              CustomComingSoonListView(),
              CustomDiscountCort(),
              CustomServices(),
              CustomMovieNews(),
            ],
          ),
        ),
      ),

      // bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _playingMovie.startAutoScrollBanner();
  }


}

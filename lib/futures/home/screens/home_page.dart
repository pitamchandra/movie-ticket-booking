import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/home/logic/plaing_now_controller.dart';

import '../data/home_image.dart';
import '../logic/home_color_controller.dart';
import '../widget/home_search_bar.dart';
import '../widget/home_tupper_text.dart';
import '../widget/playing_movie_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: HomeColorController.backgroundColor(context),
      body: SafeArea(
        child: Column(
          children: [
            HomeTupperText(),
            HomeSearchBar(),
            PlayingMoviePageView()
          ],
        ),
      ),
    );
  }

}







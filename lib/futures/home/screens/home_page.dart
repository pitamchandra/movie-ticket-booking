import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../logic/home_color_controller.dart';
import '../widget/custom_coming_soon_list_view.dart';
import '../widget/custom_discount_cort.dart';
import '../widget/custom_see_all_button.dart';
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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
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
              CustomDiscountCort()
            ],
          ),
        ),
      ),
    );
  }
}







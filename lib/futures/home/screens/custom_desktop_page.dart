import 'package:flutter/material.dart';

import '../widget/custom_coming_soon_list_view.dart';
import '../widget/custom_discount_cort.dart';
import '../widget/home_search_bar.dart';
import '../widget/home_tupper_text.dart';
import '../widget/playing_movie_page_view.dart';
class CustomDesktopPage extends StatelessWidget {
  const CustomDesktopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: height*0.015,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: HomeTupperText()),
                      Expanded(child: HomeSearchBar()),

                    ],
                  ),
                  SizedBox(height:height*0.01),

                  SizedBox(height:height*0.01),
                  PlayingMoviePageView(),
                  CustomDiscountCort(),

                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: CustomComingSoonListView(),
            ),
          ],
        ),
      ],
    );
  }
}

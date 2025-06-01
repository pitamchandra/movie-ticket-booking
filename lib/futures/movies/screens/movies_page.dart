import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/movies/logic/movies_controller.dart';
import 'package:movie_ticket_booging/futures/movies/widget/coming_playing_body.dart';
import 'package:movie_ticket_booging/futures/movies/widget/custom_buttom.dart';
import 'package:movie_ticket_booging/futures/movies/widget/now_playing_body.dart';

class MoviesPage extends StatelessWidget {
  final MoviesController controller = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomButtom(),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(() {
                if (controller.selectedTab.value == 'now') {
                  return NowPlayingBody();
                } else {
                  return ComingPlayingBody();
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/home/data/home_image.dart';
import 'package:movie_ticket_booging/futures/home/logic/plaing_now_controller.dart';
import 'package:movie_ticket_booging/futures/home/widget/custom_see_all_button.dart';
class CustomServices extends StatelessWidget {
  const CustomServices({super.key});

  @override
  Widget build(BuildContext context) {
    PlayingMovieController _playingMovie = Get.find<PlayingMovieController>();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSeeAllButton(text: "service".tr),
        GetBuilder(
          init: _playingMovie,
            builder: (playingMovie){
            return SizedBox(
              height: height*0.18,
              width: width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: HomeImage.palingMovieList.length,  // Number of items
                itemBuilder: (BuildContext context, int index) {
                  final movie = HomeImage.palingMovieList[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: EdgeInsets.all(width*0.02),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage("${movie['image']}"),
                        ),
                      ),
                      SizedBox(height: height*0.002,),
                      Text("${movie['name']}".length >6 ? "${movie['name']}".substring(0,6):"${movie['name']}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,),
                    ],
                  );
                },
              ),
            );
            }),

      ],
    );
  }
}

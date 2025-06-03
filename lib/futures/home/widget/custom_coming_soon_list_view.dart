import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../details_page/screens/details_page.dart';
import '../logic/plaing_now_controller.dart';
import 'custom_see_all_button.dart';
class CustomComingSoonListView extends StatelessWidget {
  const CustomComingSoonListView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    bool isDesktop = width > 800;
    PlayingMovieController _playingMovie = Get.find<PlayingMovieController>();
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,),
      child: Column(

        children: [
      SizedBox(
      height:isDesktop?height*0.02: 0,),
          CustomSeeAllButton(text: "coming_soon".tr,),
          SizedBox(
            height:isDesktop?height:height*0.44,
            width: width,
            child: ListView.builder(
              scrollDirection:isDesktop? Axis.vertical: Axis.horizontal,
                itemBuilder: (context, index) {
                  final movie = _playingMovie.loopedList[index];
                  return InkWell(
                    onTap: (){
                      goToDetailsPage(movie);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                            margin: EdgeInsets.all(10),
                            height: height * 0.30,
                            width: width * 0.4,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                movie['image'],
                                fit: BoxFit.cover, // তুমি চাইলে BoxFit.cover ব্যবহার করতে পারো
                              ),
                            ),
                          ),
                        Text(
                          movie['name'].length > 15
                              ? movie['name'].substring(0, 15)
                              : movie['name'],
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.amber),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Icon(Icons.video_camera_back_outlined,),
                            SizedBox(width: width*0.01,),
                            Text(
                              "${movie['description']}".length > 15? "${movie['description']}".substring(0, 15):"${movie['description']}",
                              style: TextStyle(fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month,),
                            SizedBox(width: width*0.01,),
                            Text(
                              "20.12.2020",
                              style: TextStyle(fontSize: 15),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                    
                    
                      ],
                    ),
                  );

                }
            ),
          )
        ],
      ),
    );
  }
  void goToDetailsPage(movie) {
    Get.to(DetailsPage(movie: movie,));
  }
}

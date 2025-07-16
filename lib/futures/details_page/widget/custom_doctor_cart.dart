import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/home/logic/plaing_now_controller.dart';

class CustomDoctorCart extends StatelessWidget {
  String text;
  CustomDoctorCart({super.key, this.text = "test"});
  @override
  Widget build(BuildContext context) {
    PlayingMovieController _playingMovie = Get.find<PlayingMovieController>();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: screenHeight * 0.01),
        Text(
          "${text}",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: screenHeight * 0.01),
        GetBuilder(
          init: _playingMovie,
          builder: (playingMovie) {
            return SizedBox(
              height: screenHeight * 0.1,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: playingMovie.loopedList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: screenWidth * 0.45,
                    height: screenHeight * 0.01,
                    child: Card(
                      color: Color(0xff1c1c1c),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            "${playingMovie.loopedList[index]["image"]}",
                          ),
                        ),
                        title: Text(
                          "${playingMovie.loopedList[index]["name"]}".length > 6
                              ? "${playingMovie.loopedList[index]["name"]}"
                                  .substring(0, 6)
                              : "${playingMovie.loopedList[index]["name"]}",
                        ),
                        subtitle: Text(
                          "${playingMovie.loopedList[index]["name"]}".length > 6
                              ? "${playingMovie.loopedList[index]["name"]}"
                                  .substring(0, 6)
                              : "${playingMovie.loopedList[index]["name"]}",
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/home/data/home_image.dart';

import '../../home/widget/custom_see_all_button.dart';

class CustomDetailsCinemaListViews extends StatefulWidget {
  CustomDetailsCinemaListViews({super.key});

  @override
  State<CustomDetailsCinemaListViews> createState() =>
      _CustomDetailsCinemaListViewsState();
}

class _CustomDetailsCinemaListViewsState
    extends State<CustomDetailsCinemaListViews> {
  final RxInt _currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomSeeAllButton(text: "Cinema"),
        SizedBox(
          height: height * 0.3,
          child: ListView.builder(
            itemCount: HomeImage.palingMovieList.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = HomeImage.palingMovieList[index];

              return Obx(() {
                bool selected = _currentIndex.value == index;
                return Card(
                  color: selected ? Color(0xff261d08) : Color(0xff1c1c1c),
                  child: ListTile(
                    onTap: () {
                      _currentIndex.value = index;
                    },
                    leading: CircleAvatar(
                      backgroundImage: AssetImage("${movie["image"]}"),
                    ),
                    title: Text(
                      "${movie["name"]}".length > 10
                          ? "${movie["name"]}".substring(0, 10)
                          : "${movie["name"]}",
                    ),
                    subtitle: Text(
                      "${movie["name"]}".length > 10
                          ? "${movie["name"]}".substring(0, 10)
                          : "${movie["name"]}",
                    ),
                    trailing: Container(
                      height: height * 0.015,
                      width: width * 0.05,
                      child: Image(
                        image: AssetImage("${movie["image"]}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}

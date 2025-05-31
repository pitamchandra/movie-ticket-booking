import 'package:flutter/material.dart';
class CustomDetailsCover extends StatelessWidget {
  var movieData;
 CustomDetailsCover({super.key,this.movieData});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return  Column(
      children: [
        Container(
          height: height*0.3,
          width: double.infinity,
          child: Image(image:AssetImage("${movieData["image"]}"),fit: BoxFit.cover,),
        ),
      ],
    );
  }
}

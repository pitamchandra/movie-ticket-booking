import 'package:flutter/material.dart';
class CustomDetailsText extends StatelessWidget {
  var movieData;
  CustomDetailsText({super.key,this.movieData});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Movie Genre:"),
              Text("Action, adventure, sci-fi",style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: height*0.01,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Censorship:"),
              Text("13+",style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: height*0.01,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Language:"),
              Text(
                "English",style: TextStyle(fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: height*0.01,),
          Text("Storyline",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          SizedBox(height: height*0.01,),
          Container(
            width: width*0.9,
            child: Text(
              "As the Avengers and their allies continue"
                  "to protect the world from threats too great"
                  "for any one hero to handle, a new danger"
                  "emerges from the cosmic shadows: Thanos...",
              style: TextStyle(fontSize: 17),
              // overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          ),


          // maxLines: 4,

        ],
      ),
    );
  }
}

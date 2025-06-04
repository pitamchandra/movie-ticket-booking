import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';

class CustomDetailsCard extends StatelessWidget {
  var movieData;
  CustomDetailsCard({super.key, this.movieData});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(1),
      height: screenHeight * 0.282,
      width: double.infinity,
      child: Card(
        color: Color(0xFF1C1C1C),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${movieData["name"]}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text("2h29m • 16.12.2022", style: TextStyle(fontSize: 15)),
              SizedBox(height: screenHeight * 0.07),
              Row(
                children: [
                  Text("Rating:"),
                  StarRating(
                    rating: 1,
                    allowHalfRating: true,
                    starCount: 1,
                    color: Colors.amber,
                  ),
                  Text("${movieData["rating"]}"),
                ],
              ),
              Row(
                children: [
                  StarRating(
                    rating: 3.5,
                    allowHalfRating: true,
                    starCount: 5,
                    color: Colors.amber,
                    size: 30,
                  ),
                  // Spacer(),
                  OutlinedButton(
                    onPressed: () {
                      // Action here
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: Colors.orange,
                        width: screenWidth * 0.01,
                      ), // বর্ডার
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5), // কর্নার রাউন্ড
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      backgroundColor:
                          Colors.transparent, // ব্যাকগ্রাউন্ড ট্রান্সপারেন্ট
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.play_arrow, color: Colors.orange),
                        SizedBox(width: screenWidth * 0.08),
                        Text(
                          "Watch Tailer",
                          style: TextStyle(color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

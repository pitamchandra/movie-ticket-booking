import 'package:flutter/material.dart';

import '../../home/data/home_image.dart';

class CustomselectMovieByPayment extends StatelessWidget {
  const CustomselectMovieByPayment({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final movieData = HomeImage.palingMovieList[0];
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1C),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Movie Poster
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              movieData["image"],
              width: screenWidth * 0.16,
              height: screenHeight * 0.16,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: screenWidth * 0.02),
          // Movie Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  movieData["name"],
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),

                // Genres
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.category, size: 16, color: Colors.white70),
                    SizedBox(width: screenWidth * 0.01),
                    Expanded(
                      child: Text(
                        "sdkjf",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),

                // Venue
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.white70,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Expanded(
                      child: Text(
                        "sdkjsd",
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.01),

                // Date & Time
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.white70,
                    ),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      "10.12.2022 • 14:15",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

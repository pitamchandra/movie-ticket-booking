import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/movies/logic/movies_controller.dart';

class NowPlayingBody extends StatelessWidget {
  NowPlayingBody({super.key});
  final MoviesController controller = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.48,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: controller.nowPlayingList.length,
      itemBuilder: (context, index) {
        final movie = controller.nowPlayingList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                movie.imageUrl,
                height: 260,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 14),
                SizedBox(width: screenWidth * 0.005),
                Text(
                  movie.rating,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.005),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.white54, size: 14),
                SizedBox(width: screenWidth * 0.005),
                Text(
                  movie.duration,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.005),
            Text(
              movie.action,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}

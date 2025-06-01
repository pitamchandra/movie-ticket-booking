import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/movies/logic/movies_controller.dart';

class ComingPlayingBody extends StatelessWidget {
  ComingPlayingBody({super.key});
  final MoviesController controller = Get.put(MoviesController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.55,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
      ),
      itemCount: controller.comingSoonList.length,
      itemBuilder: (context, index) {
        final movie = controller.comingSoonList[index];
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                movie.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
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
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, color: Colors.amber, size: 14),
                const SizedBox(width: 4),
                Text(
                  movie.date,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              movie.adventure,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}

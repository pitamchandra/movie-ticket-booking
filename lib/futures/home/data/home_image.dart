import 'package:movie_ticket_booging/core/constants/image/home_image_path.dart';
class HomeImage{
  static List<Map<String, dynamic>> palingMovieList = [
    {
      'id': 1,
      'name': 'Avengers - Infinity War',
      'description': 'A skilled thief is given a chance at redemption if he can successfully perform inception.',
      'rating': 8.8,
      'image': HomeImagesPath.movie1Image,
    },
    {
      'id': 2,
      'name': 'Avengers - Infinity War',
      'description': 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
      'rating': 8.6,
      'image': HomeImagesPath.movie2Image,
    },
    {
      'id': 3,
      'name': 'The Dark Knight',
      'description': 'Batman sets out to dismantle the remaining criminal organizations that plague Gotham.',
      'rating': 9.0,
      'image': HomeImagesPath.movie3Image,
    },
  ];
}
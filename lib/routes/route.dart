import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_ticket_booging/futures/home/screens/home_page.dart';

class AppRoutes {
  static const String initial = '/';
  static final List<GetPage> routes = [
    GetPage(name: initial, page: () => HomePage()),
  ];
}
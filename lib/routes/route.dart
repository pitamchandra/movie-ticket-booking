import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_ticket_booging/futures/select_seat/screen/select_seat.dart';
class AppRoutes {
  static const String initial = '/';
  static final List<GetPage> routes = [
    GetPage(name: initial, page: () => SelectSeat()),
    //GetPage(name: initial, page: () => HomePage()),
  ];
}

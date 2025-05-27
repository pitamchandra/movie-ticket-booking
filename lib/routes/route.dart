import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movie_ticket_booging/futures/auth/screens/sign_in.dart';

class AppRoutes {
  static const String initial = '/';

  static final List<GetPage> routes = [
    // GetPage(name: initial, page: () => HomePage()),
    GetPage(name: initial, page: () => SignIn()),
  ];
}

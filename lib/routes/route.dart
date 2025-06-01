import 'package:get/get_navigation/src/routes/get_route.dart';
import '../futures/auth/screens/onbording.dart';
class AppRoutes {
  static const String initial = '/';
  static final List<GetPage> routes = [
    //GetPage(name: initial, page: () => PaymentPage()),
    GetPage(name: initial, page: () => Onbording()),
  ];
}
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../futures/payment_page/screen/payment_page.dart';
class AppRoutes {
  static const String initial = '/';
  static final List<GetPage> routes = [
    GetPage(name: initial, page: () => PaymentPage()),
    //GetPage(name: initial, page: () => HomePage()),
  ];
}

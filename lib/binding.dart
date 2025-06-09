import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/details_page/logic/select_seat_controller.dart';

import 'futures/home/logic/plaing_now_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<PlayingMovieController>(PlayingMovieController());
    Get.put<SeatController>(SeatController());
  }
}

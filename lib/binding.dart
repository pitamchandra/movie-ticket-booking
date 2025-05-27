import 'package:get/get.dart';
import 'futures/home/logic/plaing_now_controller.dart';

class BindingController extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<PlayingMovieController>(PlayingMovieController());

  }

}
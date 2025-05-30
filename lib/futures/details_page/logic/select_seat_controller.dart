import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SeatController extends GetxController {
  final RxList<String> bookedSeats = <String>[
    'D6','D7','D8','D9','D10','E4','E5','E6','E7','E8','E9','E10','E11','E12','F7','F8','F9','F10'
  ].obs;

  final RxList<String> selectedSeats = <String>[].obs;

  void toggleSeat(String seat) {
    if (bookedSeats.contains(seat)) return;
    if (selectedSeats.contains(seat)) {
      selectedSeats.remove(seat);
    } else {
      selectedSeats.add(seat);
    }
  }
}

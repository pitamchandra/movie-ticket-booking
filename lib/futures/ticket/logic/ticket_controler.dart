import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/ticket/data/ticket_model.dart';

class TicketControler extends GetxController {
  var tickets = [].obs;

  @override
  void onInit() {
    super.onInit();
    loadTickets();
  }

  void loadTickets() {
    tickets.value = [
      Ticket(
        title: 'avengers_infinity'.tr,
        duration: 'date_of_time'.tr,
        location: 'vincom_ocean_park'.tr,
        imageUrl: 'assets/images/movie1.png',
      ),
      Ticket(
        title: 'batman_superman'.tr,
        duration: 'date_of_time1'.tr,
        location: 'vincom_ocean_park'.tr,
        imageUrl: 'assets/images/onbording4.png',
      ),
      Ticket(
        title: 'guardians_of_galaxy'.tr,
        duration: 'date_of_time2'.tr,
        location: 'vincom_ocean_park'.tr,
        imageUrl: 'assets/images/onbording5.png',
      ),
    ];
  }
}

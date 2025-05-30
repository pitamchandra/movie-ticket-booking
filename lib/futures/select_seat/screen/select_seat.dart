import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/details_page/logic/select_seat_controller.dart';
import 'package:movie_ticket_booging/futures/select_seat/widget/custom_select_seat_list.dart';

import '../widget/bottom_ticket_bar.dart';
import '../widget/custom_date_time_picer.dart';
import '../widget/custom_seat_divider.dart';
class SelectSeat extends StatelessWidget {
  SelectSeat({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Select Seat"),
      ),
      body: Column(
        children: [
          CustomSeatDivider(),
          CustomSelectSeatList(),
          CustomDateTimePicker()

        ],
      ),
     bottomNavigationBar: BottomTicketBar(amount: 210000),
    );
  }
}

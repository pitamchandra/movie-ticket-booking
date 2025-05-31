import 'package:flutter/material.dart';

import '../widget/custom_select_movie_by_payment.dart';
import '../widget/date_seat_info.dart';
import '../widget/ticket_details_section.dart';
class MovieTicketPage extends StatelessWidget {
  const MovieTicketPage({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: width*0.82,
            height: height*0.7,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                )
              ],
            ),
            child: Column(
              children: [
                CustomselectMovieByPayment(),
                DateSeatInfo(
                  time: '14h15\'',
                  date: '10.12.2022',
                  section: 'Section 4',
                  seats: 'H7, H8',
                ),
                TicketDetailsSection(),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

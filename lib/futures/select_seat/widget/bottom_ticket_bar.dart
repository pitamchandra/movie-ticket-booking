import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/payment_page/screen/payment_page.dart';

class BottomTicketBar extends StatelessWidget {
  final double amount;
  const BottomTicketBar({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final width = size.width;
    final height = size.height;
    return Container(
      height: height * 0.09,

      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Total Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Total', style: TextStyle(fontSize: 14)),
              Text(
                '${amount.toStringAsFixed(0)} VND',
                style: const TextStyle(
                  color: Color(0xFFFFC107),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Buy Ticket Button
          ElevatedButton(
            onPressed: () {
              Get.to(PaymentPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFC107),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            ),
            child: const Text(
              'Buy ticket', // fixed typo from "But ticket"
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

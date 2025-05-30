import 'package:flutter/material.dart';

class DateSeatInfo extends StatelessWidget {
  final String time;
  final String date;
  final String section;
  final String seats;
  const DateSeatInfo({
    super.key,
    required this.time,
    required this.date,
    required this.section,
    required this.seats,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Time & Date
        Row(
          children: [
            const Icon(Icons.calendar_today, size: 28, color: Colors.black87),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(time,
                    style: const TextStyle(color: Colors.black,
                        fontSize: 14, fontWeight: FontWeight.w600)),
                Text(date,
                    style: const TextStyle(color: Colors.black,
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),

        // Section & Seat
        Row(
          children: [
            const Icon(Icons.event_seat, size: 28, color: Colors.black87),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(section,
                    style: const TextStyle(color: Colors.black,
                        fontSize: 14, fontWeight: FontWeight.w600)),
                Text("Seat $seats",
                    style: const TextStyle(color: Colors.black,
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

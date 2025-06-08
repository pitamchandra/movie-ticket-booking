import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../details_page/logic/select_seat_controller.dart';
import 'Custom_color_checker.dart';

class CustomSelectSeatList extends StatefulWidget {
  const CustomSelectSeatList({super.key});
  @override
  State<CustomSelectSeatList> createState() => _CustomSelectSeatListState();
}

class _CustomSelectSeatListState extends State<CustomSelectSeatList> {
  final SeatController _seatController = Get.find<SeatController>();
  final List<String> rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'];
  final int seatsPerRow = 13;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          height: height * 0.40,
          child: Obx(() {
            return ListView(
              children:
                  rows.map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(seatsPerRow, (index) {
                        String seatLabel = "$row${index + 1}";
                        Color seatColor;
                        bool selectedTextColor = false;

                        if (_seatController.selectedSeats.contains(seatLabel)) {
                          seatColor = Colors.amber;
                        } else if (_seatController.bookedSeats.contains(
                          seatLabel,
                        )) {
                          seatColor = Color(0xff261d08);
                          selectedTextColor = true;
                        } else {
                          seatColor = Colors.grey.shade900;
                        }

                        return Padding(
                          padding: const EdgeInsets.all(1), // একটু কম padding
                          child: GestureDetector(
                            onTap: () => _seatController.toggleSeat(seatLabel),
                            child: Container(
                              width: 25, // ছোট বক্স
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: seatColor,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(
                                seatLabel,
                                style: TextStyle(
                                  color:
                                      selectedTextColor == true
                                          ? Colors.amber
                                          : null,
                                  fontSize: 8, // ছোট টেক্সট
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  }).toList(),
            );
          }),
        ),
        SizedBox(height: height * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            CustomColorChecker(color: Color(0xFF1C1C1C), label: 'Available'),
            CustomColorChecker(color: Color(0xFF2D230F), label: 'Reserved'),
            CustomColorChecker(color: Color(0xFFFFC107), label: 'Selected'),
          ],
        ),
      ],
    );
  }
}

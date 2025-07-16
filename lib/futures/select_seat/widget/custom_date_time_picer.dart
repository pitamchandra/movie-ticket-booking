import 'package:flutter/material.dart';

class CustomDateTimePicker extends StatefulWidget {
  const CustomDateTimePicker({super.key});

  @override
  State<CustomDateTimePicker> createState() => _CustomDateTimePickerState();
}
class _CustomDateTimePickerState extends State<CustomDateTimePicker> {
  int selectedDateIndex = 3; // Dec 10
  int selectedTimeIndex = 1; // 14:15
  final List<int> days = List.generate(30, (index) => index + 1);
  final List<String> times = List.generate(12, (index) {
    final hour = (index * 2) % 24;
    final hourStr = hour.toString().padLeft(2, '0');
    return '$hourStr:00';
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Column(
      mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Select Date & Time',
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            SizedBox(height: height*0.01,),
            // Date Scroll
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: days.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final isSelected = index == selectedDateIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      width: 55,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.amber : Colors.grey[900],
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            'Dec',
                            style: TextStyle(
                              color:isSelected ? Colors.black : Colors.white60,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: isSelected
                                ? Colors.black
                                : Colors.grey[800],
                            child: Text(
                              '${days[index]}',
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.amber
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 30),

            // Time Scroll
            SizedBox(
              height: height*0.075,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: times.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  final isSelected = index == selectedTimeIndex;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedTimeIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 10),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xff261d08) : Colors.grey[900],
                        borderRadius: BorderRadius.circular(30),
                        border: isSelected
                            ? Border.all(color: Colors.amberAccent, width: 2)
                            : null,
                      ),
                      child: Text(
                        times[index],
                        style: TextStyle(
                          fontSize: 16,
                          color: isSelected ? Colors.white : Colors.grey.shade300,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              )
            )
          ]
        )

    ;
  }
}
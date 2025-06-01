import 'package:flutter/material.dart';
class CustomSeatDivider extends StatelessWidget {
  const CustomSeatDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container( margin: const EdgeInsets.symmetric(horizontal: 15),
    height: 40,
    decoration: BoxDecoration(
    color: Colors.transparent,
    border: const Border(
    top: BorderSide(
    color: Color(0xFFFFC107),
    width: 4,
    ),
    ),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.9),
    offset: const Offset(0, 15),
    blurRadius: 40,
    spreadRadius: 10,
    ),
    ],
    ));
  }
}

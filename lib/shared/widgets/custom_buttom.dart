import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String buttonText;
  final VoidCallback onPressed;
  Color color;
  Color textColor;

  CustomButton({
    super.key,
    required this.buttonText,
    required this.color,
    required this.onPressed,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        minimumSize: Size(screenHeight * 0.55, screenWidth * 0.15),
        maximumSize: Size(screenHeight * 0.55, screenWidth * 0.15),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: screenWidth * 0.005, color: Colors.white),
          borderRadius: BorderRadius.circular(64),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}

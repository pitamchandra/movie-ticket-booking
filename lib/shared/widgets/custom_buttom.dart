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
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        minimumSize: const Size(398, 56),
        maximumSize: const Size(398, 56),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.white),
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

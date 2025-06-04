// import 'package:flutter/material.dart';

// // ignore: must_be_immutable
// class CustomButton extends StatelessWidget {
//   String buttonText;
//   final VoidCallback onPressed;
//   Color color;
//   Color textColor;

//   CustomButton({
//     super.key,
//     required this.buttonText,
//     required this.color,
//     required this.onPressed,
//     required this.textColor,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         elevation: 0,
//         backgroundColor: color,
//         minimumSize: Size(screenHeight * 0.55, screenWidth * 0.15),
//         maximumSize: Size(screenHeight * 0.55, screenWidth * 0.15),
//         shape: RoundedRectangleBorder(
//           side: BorderSide(width: screenWidth * 0.005, color: Colors.white),
//           borderRadius: BorderRadius.circular(64),
//         ),
//       ),
//       onPressed: onPressed,
//       child: Text(
//         buttonText,
//         style: TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w700,
//           color: textColor,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.color,
    required this.onPressed,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive size based on screen width
    double buttonWidth;
    double buttonHeight;
    double fontSize;

    if (screenWidth < 600) {
      // Mobile
      buttonWidth = screenWidth * 0.8;
      buttonHeight = 50;
      fontSize = 16;
    } else if (screenWidth < 1024) {
      // Tablet
      buttonWidth = screenWidth * 0.6;
      buttonHeight = 60;
      fontSize = 18;
    } else {
      // Desktop
      buttonWidth = screenWidth * 0.9;
      buttonHeight = 70;
      fontSize = 20;
    }

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        minimumSize: Size(buttonWidth, buttonHeight),
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Colors.white),
          borderRadius: BorderRadius.circular(64),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}

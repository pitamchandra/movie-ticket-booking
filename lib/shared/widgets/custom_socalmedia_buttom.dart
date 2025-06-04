// import 'package:flutter/material.dart';

// class CustomSocialButton extends StatelessWidget {
//   final String imagePath;
//   final String text;
//   final VoidCallback onPressed;
//   final Color backgroundColor;
//   final Color textColor;

//   const CustomSocialButton({
//     super.key,
//     required this.imagePath,
//     required this.text,
//     required this.onPressed,
//     this.backgroundColor = const Color(0xFF1A1A1A),
//     this.textColor = Colors.white,
//   });

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;

//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         height: screenHeight * 0.072,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(64),
//           color: backgroundColor,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imagePath,
//               height: screenHeight * 0.2,
//               width: screenWidth * 0.05,
//             ),
//             SizedBox(width: screenWidth * 0.02),
//             Text(
//               text,
//               style: TextStyle(
//                 color: textColor,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w700,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomSocialButton extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  const CustomSocialButton({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF1A1A1A),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final screenHeight = MediaQuery.of(context).size.height;

    // Responsive size
    double buttonWidth;
    double buttonHeight;
    double fontSize;
    double imageSize;

    if (screenWidth < 600) {
      // Mobile
      buttonWidth = screenWidth * 0.8;
      buttonHeight = 50;
      fontSize = 16;
      imageSize = 24;
    } else if (screenWidth < 1024) {
      // Tablet
      buttonWidth = screenWidth * 0.6;
      buttonHeight = 60;
      fontSize = 18;
      imageSize = 28;
    } else {
      // Desktop
      buttonWidth = screenWidth * 0.9;
      buttonHeight = 70;
      fontSize = 20;
      imageSize = 32;
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(64),
          color: backgroundColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: imageSize, width: imageSize),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

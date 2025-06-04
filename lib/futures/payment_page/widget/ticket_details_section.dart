import 'package:flutter/material.dart';

class TicketDetailsSection extends StatelessWidget {
  const TicketDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    const textColor = Colors.black87;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(thickness: 1),
          SizedBox(height: screenHeight * 0.01),

          // Price
          Row(
            children: [
              Icon(Icons.attach_money, size: 20, color: textColor),
              SizedBox(width: screenWidth * 0.02),
              Text(
                '210.000 VND',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          // Location with label
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.location_on, size: 22, color: textColor),
              SizedBox(width: screenWidth * 0.01),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Vincom Ocean Park ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: textColor,
                        ),
                      ),
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Image(
                            image: NetworkImage(
                              'https://static.vecteezy.com/system/resources/previews/005/663/514/origin'
                              'al/ticket-logo-or-icon-design-vector.jpg',
                            ),
                            fit: BoxFit.cover,
                            height: screenWidth * 0.07,
                          ),
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n4th floor, Vincom Ocean Park, Da Ton, Gia Lam, Ha Noi',
                        style: TextStyle(
                          fontSize: 14,
                          color: textColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          // QR code instruction
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.qr_code_2, size: 20, color: textColor),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: Text(
                  'Show this QR code to the ticket counter to receive your ticket',
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: screenHeight * 0.01),
          SizedBox(
            height: screenHeight * 0.1,
            child: Stack(
              children: [
                // Dashed Line
                Positioned.fill(
                  child: CustomPaint(painter: DashedLinePainter()),
                ),

                // Left semicircle
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: screenWidth * 0.03,
                    height: screenHeight * 0.03,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                  ),
                ),

                // Right semicircle
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: screenWidth * 0.03,
                    height: screenHeight * 0.03,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const dashWidth = 5.0;
    const dashSpace = 5.0;
    double startX = 30; // left cutout width
    final paint =
        Paint()
          ..color = Colors.grey
          ..strokeWidth = 1;

    while (startX < size.width - 30) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

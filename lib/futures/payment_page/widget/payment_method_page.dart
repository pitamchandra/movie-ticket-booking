import 'package:flutter/material.dart';

import '../../home/data/home_image.dart';
class PaymentMethodSection extends StatefulWidget {
  const PaymentMethodSection({super.key});

  @override
  State<PaymentMethodSection> createState() => _PaymentMethodSectionState();
}

class _PaymentMethodSectionState extends State<PaymentMethodSection> {
  int selectedIndex = 2; // Shopee Pay selected by default

  final List<Map<String, dynamic>> paymentOptions = HomeImage.palingMovieList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height:height*0.02,),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Payment Method',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: height*0.01,),
        SizedBox(
          height: height*0.32,
          child: ListView.separated(
            itemCount: paymentOptions.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final option = paymentOptions[index];
              final isSelected = index == selectedIndex;

              return InkWell(
                onTap: () => setState(() => selectedIndex = index),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1C1C1C),
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? Border.all(color: Color(0xFFFFC107), width: 1.5)
                        : null,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        option['image'],
                        height: 36,
                        width: 36,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              option['name'],
                              style: const TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            if (option['subtitle'] != null)
                              Text(
                                option['subtitle'],
                                style: const TextStyle(color: Colors.white54, fontSize: 12),
                              ),
                          ],
                        ),
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        // Bottom bar with countdown
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Complete your payment in',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Text(
                '15:00',
                style: TextStyle(
                  color: Color(0xFFFFC107),
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    )
    ;
  }
}
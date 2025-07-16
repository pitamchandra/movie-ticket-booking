import 'package:flutter/material.dart';
class CustomPromoSection extends StatefulWidget {
  const CustomPromoSection({super.key});
  @override
  State<CustomPromoSection> createState() => _CustomPromoSectionState();
}
class _CustomPromoSectionState extends State<CustomPromoSection> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _promoController = TextEditingController();
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        // Order ID and Seat
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Oder ID", style: TextStyle(color: Colors.white)),
            Text("78889377726", style: const TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Seat", style: TextStyle(color: Colors.white)),
            Text("H7, H8", style: const TextStyle(color: Colors.white)),
          ],
        ),
        const SizedBox(height: 16),

        // Promo Code Field
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _promoController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.local_offer, color: Colors.white),
                  hintText: 'discount code',
                  hintStyle: const TextStyle(color: Colors.white54),
                  filled: true,
                  fillColor: const Color(0xFF1C1C1C),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Total", style: TextStyle(color: Colors.white)),
            Text(
              '189.000 VND',
              style: const TextStyle(
                color: Color(0xFFFFC107),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

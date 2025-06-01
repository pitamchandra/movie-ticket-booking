import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../select_seat/screen/select_seat.dart';
import '../../select_seat/widget/continue_button.dart';
import '../widget/custom_details_card.dart';
import '../widget/custom_details_cinema_list_views.dart';
import '../widget/custom_details_cover.dart';
import '../widget/custom_details_text.dart';
import '../widget/custom_doctor_cart.dart';
class DetailsPage extends StatefulWidget {
  final dynamic movie;
  DetailsPage({super.key, this.movie});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}
class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final movieData = widget.movie;
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Stack(
        children: [
          CustomDetailsCover(movieData: movieData),
          Positioned(
            top: 200,
            left: 0,
            right: 0,
            bottom: 0, // নিচ পর্যন্ত জায়গা দিচ্ছি
            child: Container(
              width: width,
              height: height - 200, // Stack-এর বাকি অংশটা
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDetailsCard(movieData: movieData),
                    const SizedBox(height: 16),
                    CustomDetailsText(),
                    const SizedBox(height: 16),
                    CustomDoctorCart(text: "Doctor"),
                    const SizedBox(height: 8),
                    CustomDoctorCart(text: "Actor"),
                    CustomDetailsCinemaListViews(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: ContinueButton(
        onPressed: () {
          goToDetailsPage();
          // Handle continue action
        },
      ),
    );
  }

  void goToDetailsPage() {
    Get.to(SelectSeat());
  }
}

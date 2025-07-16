import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/payment_page/screen/movie_ticket_page.dart';
import 'package:movie_ticket_booging/shared/widgets/custom_buttom.dart';

import '../widget/custom_promo_section.dart';
import '../widget/custom_select_movie_by_payment.dart';
import '../widget/payment_method_page.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final width = size.width;
    final height = size.height;

    return Scaffold(
      appBar: AppBar(title: Text("Payment"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomselectMovieByPayment(),
              SizedBox(height: height * 0.02),
              CustomPromoSection(),
              PaymentMethodSection(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomButton(
        buttonText: "Continue",
        color: Colors.amber,
        onPressed: () {
          goToTriketPage();
        },
        textColor: Colors.black,
      ),
    );
  }

  void goToTriketPage() {
    Get.to(MovieTicketPage());
  }
}

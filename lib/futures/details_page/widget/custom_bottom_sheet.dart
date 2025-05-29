import 'package:flutter/material.dart';
class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Container(
      height: height*0.1,
      width: width*0.9,
child: ClipRRect(
  borderRadius: BorderRadius.circular(20),
  child: Container(
    height: height*0.07,
    width: 20,
    color: Colors.amber,
    child:Text("lsdjfsh ") ,
  ),
),


    );
  }
}

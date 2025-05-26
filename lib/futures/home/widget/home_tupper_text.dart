import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeTupperText extends StatelessWidget {
  const HomeTupperText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: ListTile(
        minVerticalPadding: 0,
        minLeadingWidth: 0,
        title: Text("hi".tr),
        subtitle: Text("welcome".tr,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
        trailing:Stack(
          children: [
            Icon(Icons.notifications,size: 30,),
            Positioned(
                right: 0,
                child: Icon(Icons.circle,color: Colors.green,size: 15,))
          ],
        ),),



    );
  }
}
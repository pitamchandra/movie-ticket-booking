import 'package:flutter/material.dart';
import 'package:get/get.dart';
class HomeTupperText extends StatelessWidget {
  const HomeTupperText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final bool isDesktop = width > 800;
    return Padding(
      padding:  EdgeInsets.all(isDesktop? 10:0),
      child: Container(
        width:width,
        child: ListTile(
          minVerticalPadding: 0,
          minLeadingWidth: 0,
          title: Text("hi".tr,style: TextStyle(fontSize:isDesktop?width*0.01: width*0.035),),
          subtitle: Text("welcome".tr,style: TextStyle(fontSize:isDesktop?width*0.03: width*0.045,fontWeight: FontWeight.bold),),
        trailing: Stack(
            children: [
              Icon(Icons.notifications,size: 30,),
              Positioned(
                  right: 0,
                  child: Icon(Icons.circle,color: Colors.green,size: 15,))
            ],
          ),),



      ),
    );
  }
}
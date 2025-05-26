import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../logic/home_color.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColor.backgroundColor(context),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListTile(
                title: Text("hi".tr),
                subtitle: Text("welcome".tr,style: TextStyle(fontSize: 30),),
              trailing:Stack(
                children: [
                  Icon(Icons.notifications,size: 30,),
                  Positioned(
                    right: 0,
                      child: Icon(Icons.circle,color: Colors.green,size: 15,))
                ],
              ),),
              
                

            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CustomBottomNavigationBar extends StatefulWidget {
 CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  RxInt _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
       () {
        return BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (index) {
              _selectedIndex.value = index;
          },
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.ticket), label: 'Ticket'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.video_camera), label: 'Movies'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        );
      }
    );
  }
}



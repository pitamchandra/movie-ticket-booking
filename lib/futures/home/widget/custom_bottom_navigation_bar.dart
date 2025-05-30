import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_ticket_booging/futures/home/screens/home_page.dart';
import 'package:movie_ticket_booging/futures/movies/screens/movies_page.dart';
import 'package:movie_ticket_booging/futures/profile/screens/profile_page.dart';
import 'package:movie_ticket_booging/futures/ticket/screens/ticket_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  RxInt _selectedIndex = 0.obs;
  final List<Widget> _pages = [
    HomePage(),
    TicketPage(),
    MoviesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: IndexedStack(index: _selectedIndex.value, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex.value,
          onTap: (index) {
            _selectedIndex.value = index;
          },
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.ticket),
              label: 'Ticket',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.video_camera),
              label: 'Movies',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
        ),
      );
    });
  }
}

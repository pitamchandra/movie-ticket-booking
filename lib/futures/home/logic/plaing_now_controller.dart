import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../data/home_image.dart';

class PlayingMovieController extends GetxController {
 int currentPage = 0;
  Timer? _autoScrollTimer;
  final PageController _pageController = PageController();
  PageController get pageController => _pageController;
 List<Map<String, dynamic>> loopedList = List.generate(
     100,
         (index) => HomeImage.palingMovieList[index % HomeImage.palingMovieList.length]
 );

 void startAutoScrollBanner() {
    try {
      _autoScrollTimer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (_pageController.hasClients) {
          currentPage++;
          if (currentPage >= loopedList.length) {
            currentPage = 0;
          }
          _pageController.animateToPage(
            currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInCirc,
          );
        }
      });
      update();
    }catch(e){
      Logger().e(e.toString());
    }
  }

  void stopAutoScrollBanner() {
    _autoScrollTimer?.cancel();
  }

  @override
  void onClose() {
    stopAutoScrollBanner();
    _pageController.dispose();
    super.onClose();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    loopedList;
  }
}

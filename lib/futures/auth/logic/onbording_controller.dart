import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:movie_ticket_booging/futures/auth/data/onbording_image.dart';

class OnbordingController extends GetxController {
  int currentPage = 0;
  Timer? _autoScrollTimer;

  final PageController _pageController = PageController();
  PageController get pageController => _pageController;

  //List<Map<String, dynamic>> get loopedList => OnbordingImage.onbordingplaylist;

  List<Map<String, dynamic>> get loopedList => List.generate(
    10,
    (index) =>
        OnbordingImage.onbordingplaylist[index %
            OnbordingImage.onbordingplaylist.length],
  );

  void startAutoScrollBanner() {
    try {
      _autoScrollTimer = Timer.periodic(Duration(seconds: 2), (timer) {
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
    } catch (e) {
      Logger().e(e.toString());
    }
  }

  void stopAutoScrollBanner() {
    _autoScrollTimer?.cancel();
  }

  void updatePage(int index) {
    currentPage = index % loopedList.length;
    update();
  }

  @override
  void onInit() {
    super.onInit();

    startAutoScrollBanner();
    loopedList;
  }

  @override
  void onClose() {
    stopAutoScrollBanner();
    _pageController.dispose();
    super.onClose();
  }
}

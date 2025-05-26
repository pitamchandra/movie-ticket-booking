import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../theme/dark_mode.dart';
import '../../theme/light_theme.dart';

class ThemeChanger extends GetxController {
  RxBool isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    update();
  }

  ThemeData get themeMode => !isDarkMode.value ? lightMode : darkMode;
}
import 'package:flutter/material.dart';

import '../core/constants/color/color.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      primary: ColorController.teal,
      onPrimary: ColorController.black,
      secondary: ColorController.orange,
      onSecondary: ColorController.black,
      surface: ColorController.black,
      onSurface: ColorController.white,),
     // scaffoldBackgroundColor: Colors.black,

     useMaterial3: true,
);
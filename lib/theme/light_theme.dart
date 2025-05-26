import 'package:flutter/material.dart';
import 'package:movie_ticket_booging/core/constants/color/color.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: ColorController.blue,
    onPrimary: ColorController.white,
    secondary: ColorController.orange,
    onSecondary: ColorController.white,
    surface: ColorController.grey,
    onSurface:ColorController.black),
  useMaterial3: true,
  // scaffoldBackgroundColor: ColorController.white,

);
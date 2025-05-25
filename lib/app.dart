import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_ticket_booging/routes/route.dart';
import 'package:movie_ticket_booging/theme/theme_data.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     theme: customThem,
      initialRoute: AppRoutes.initial,
     getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}

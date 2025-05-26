import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:movie_ticket_booging/core/utils/theme_changer.dart';
import 'package:movie_ticket_booging/routes/route.dart';
import 'package:movie_ticket_booging/theme/light_theme.dart';

import 'core/utils/text_translation.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeChanger themeChanger = Get.put(ThemeChanger());
    return Obx(() {
        return GetMaterialApp(
          translations:AppTranslations(),
         locale:Locale('en'),
         theme:themeChanger.themeMode,
          initialRoute: AppRoutes.initial,
         getPages: AppRoutes.routes,
          debugShowCheckedModeBanner: false,
        );
      }
    );
  }
}

import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:movie_ticket_booging/core/constants/text/home_text.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
     ...homeTextEn
    },
    "bn": {
      ...homeTextBn
    },
  };
}
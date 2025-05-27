import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:movie_ticket_booging/core/constants/text/confrim_otp.dart';
import 'package:movie_ticket_booging/core/constants/text/home_text.dart';
import 'package:movie_ticket_booging/core/constants/text/onbording_text.dart';
import 'package:movie_ticket_booging/core/constants/text/sign_in_text.dart';
import 'package:movie_ticket_booging/core/constants/text/sign_up_text.dart';
import 'package:movie_ticket_booging/core/constants/text/username_text.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      ...homeTextEn,
      ...onbordingTextEn,
      ...signinTextEn,
      ...signupTextEn,
      ...confirmotpTextEn,
      ...userNameTextEn,
    },
    "bn": {
      ...homeTextBn,
      ...onbordingTextBn,
      ...signinTextBn,
      ...signupTextBn,
      ...confirmotpTextBn,
      ...userNameTextBn,
    },
  };
}

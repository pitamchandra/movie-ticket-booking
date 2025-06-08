// import 'dart:convert';

// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:movie_ticket_booging/futures/auth/screens/confirm_otp.dart';

// class FacebookLogic extends GetxController {
//   RxMap<String, dynamic> userData = <String, dynamic>{}.obs;
//   Rx<AccessToken?> accessToken = Rx<AccessToken?>(null);
//   RxBool checking = true.obs;

//   @override
//   void onInit() {
//     _checkIfIsLogged();
//     super.onInit();
//   }

//   Future<void> _checkIfIsLogged() async {
//     final token = await FacebookAuth.instance.accessToken;
//     print("Facebook token: $token");

//     if (token != null) {
//       accessToken.value = token;
//       final data = await FacebookAuth.instance.getUserData();
//       userData.value = data;
//       print("User data: $data");
//       Get.offAll(() => ConfirmOtp());
//     }
//     checking.value = false;
//   }

//   Future<void> login() async {
//     checking.value = true;
//     final result = await FacebookAuth.instance.login();

//     print("Facebook login result: ${result.status}, ${result.message}");

//     if (result.status == LoginStatus.success) {
//       accessToken.value = result.accessToken;
//       final data = await FacebookAuth.instance.getUserData();
//       userData.value = data;

//       print("Login success!");
//       print("AccessToken: ${accessToken.value}");
//       print("UserData: $data");

//       Get.offAll(() => ConfirmOtp());
//     } else {
//       userData.clear();
//       accessToken.value = null;
//       print('Login failed: ${result.status} ${result.message}');
//     }
//     checking.value = false;
//   }

//   String prettyPrint(Map json) {
//     JsonEncoder encoder = JsonEncoder.withIndent('  ');
//     return encoder.convert(json);
//   }
// }

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class FacebookLoginController extends GetxController {
  var userData = Rxn<Map<String, dynamic>>();
  var checking = false.obs;

  Future<void> login() async {
    checking.value = true;
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final data = await FacebookAuth.instance.getUserData();
      userData.value = data;
      print("Login success: $data");
    } else {
      print("Login failed: ${result.status} ${result.message}");
    }
    checking.value = false;
  }
}

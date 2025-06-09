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

//old

/*
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
*/
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:movie_ticket_booging/futures/auth/data/facebook_model.dart';
import 'package:movie_ticket_booging/futures/home/widget/custom_bottom_navigation_bar.dart';

class AuthController extends GetxController {
  Rxn<FacebookUser> facebookUser = Rxn<FacebookUser>();

  Future<void> loginWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: ['email', 'public_profile'],
      );

      if (result.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.accessToken!.tokenString);

        // Firebase Auth এ sign in
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);

        // Optional: Firebase থেকে ইউজার info নিতে পারো
        final user = userCredential.user;
        print("Firebase Logged in as: ${user?.displayName}, ${user?.email}");

        // Navigate to Home Screen
        Get.to(CustomBottomNavigationBar());
      } else {
        Get.snackbar("Login Failed", result.message ?? "Unknown error");
      }
    } catch (e) {
      print("Facebook Login Error: $e");
      Get.snackbar("Error", "Something went wrong");
    }
  }
  Future<void> sendUserToServer(FacebookUser user) async {
    final url = Uri.parse(
      "http://your-api.com/users",
    ); // 🔁 এখানে তোমার API URL বসাও

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "name": user.name,
        "email": user.email,
        "fb_id": user.id,
        "profile_pic": user.profilePic,
      }),
    );

    if (response.statusCode == 200) {
      print("User synced successfully");
    } else {
      print("Failed to sync user: ${response.body}");
    }
  }
}
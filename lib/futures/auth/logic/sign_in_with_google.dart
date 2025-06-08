import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/auth_data_save.dart';


class SignInWithGoogle{
static  Future<UserCredential?> signInWithGoogle() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);
      prefs.setString("email", "${result.user!.email}");
      DataSave.dataSave(result.user!, result.additionalUserInfo!);
      return result;
    } catch (e) {
      Logger().e("Google Sign-In error: $e");
      return null;
    }
  }
}
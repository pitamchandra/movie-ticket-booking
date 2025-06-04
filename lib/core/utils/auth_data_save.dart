import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/users_info.dart';


class DataSave {
static Future<void> dataSave(User user, AdditionalUserInfo userInfo) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    final profileMap = userInfo.profile ?? {};
    final profile = ProfileData.fromMap(profileMap);

    final userModel = UserModel(
      email: user.email!,
      uid: user.uid,
      isNewUser: userInfo.isNewUser,
      provider: userInfo.providerId.toString(),
      createdAt: DateTime.now(),
      profile: profile,
    );

    // SharedPreferences এ ইমেইল সেভ (যদি দরকার হয়)
    final SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString("email", user.email!);
    await _firestore
        .collection("users")
        .doc(user.email)
        .set(userModel.toMap());
  }
}

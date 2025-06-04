import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_ticket_booging/core/model/users_info.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DataGet{
static Future <UserModel> dataGet ()async{
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? email = await _prefs.getString("email");
  DocumentSnapshot senapshot = await _firestore.collection("users").doc(email).get();
  return UserModel.fromMap(senapshot.data() as Map<String, dynamic>);

}
}
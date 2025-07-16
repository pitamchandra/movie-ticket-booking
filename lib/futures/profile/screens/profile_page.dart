import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:movie_ticket_booging/core/model/users_info.dart';
import 'package:movie_ticket_booging/core/utils/data_get.dart';
import 'package:movie_ticket_booging/futures/profile/widget/personal_demo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switchValue = true;
  late Future<UserModel?> _userFuture;

  @override
  void initState() {
    super.initState();
    _userFuture = dataLoading();
  }

  Future<UserModel?> dataLoading() async {
    final user = await DataGet.dataGet();
    if (user != null) {
      Logger().d("User name: ${user.email}");
    } else {
      Logger().d("No user data found");
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.07),

            /// Show user info using FutureBuilder
            FutureBuilder<UserModel?>(
              future: _userFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                  return PersonalDemo(user: snapshot.data!);
                } else {
                  return Text("No user data found");
                }
              },
            ),

            SizedBox(height: screenHeight * 0.04),
            Expanded(
              child: ListView(
                children: [
                  _buildSettingsItem(
                    icon: Icons.confirmation_num,
                    text: "my_ticket".tr,
                    onTap: () {},
                  ),
                  Divider(color: Color(0xFF4A4A4A)),
                  _buildSettingsItem(
                    icon: Icons.shopping_cart,
                    text: "payment_history".tr,
                    onTap: () {},
                  ),
                  Divider(color: Color(0xFF4A4A4A)),
                  _buildSettingsItem(
                    icon: Icons.translate,
                    text: 'language'.tr,
                    onTap: () {},
                  ),
                  Divider(color: Color(0xFF4A4A4A)),
                  _buildSettingsItem(
                    icon: Icons.lock,
                    text: 'password'.tr,
                    onTap: () {},
                  ),
                  Divider(color: Color(0xFF4A4A4A)),
                  _buildSwitchItem(
                    icon: Icons.center_focus_strong,
                    text: "face_touch_id".tr,
                  ),

                  _buildSettingsItem(
                    icon: Icons.logout,
                    text: "Logout",
                    onTap: () {
                      Get.defaultDialog(
                        title: "Logout",
                        middleText: "Are you sure you want to logout?",
                        textConfirm: "Yes",
                        textCancel: "No",
                        //confirmTextColor: Colors.white,
                        backgroundColor: Colors.grey,
                        onConfirm: () async {
                          try {
                            Get.offAllNamed('/login');
                            Get.back();
                          } catch (e) {
                            Get.back(); // Close the dialog on error too
                            Get.snackbar(
                              "Error",
                              "Logout failed: $e",
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, size: 32),
      title: Text(
        text,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 24,
        color: Color(0xFFDEDEDE),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchItem({required IconData icon, required String text}) {
    return ListTile(
      leading: Icon(icon, size: 32),
      title: Text(text, style: TextStyle(fontSize: 16)),
      trailing: Switch(
        value: _switchValue,
        activeColor: Colors.amber,
        onChanged: (bool value) {
          setState(() {
            _switchValue = value;
          });
        },
      ),
    );
  }
}

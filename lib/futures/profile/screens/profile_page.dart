import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:movie_ticket_booging/futures/profile/widget/personal_demo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _switchValue = true;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.07),
            PersonalDemo(),
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

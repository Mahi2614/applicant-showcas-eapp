import 'package:assetwize/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold, color: black),
        ),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: bordercolor, height: 1),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _settingsTile(Icons.person, "Profile", () {}),
          const Divider(),
          _settingsTile(Icons.notifications, "Notifications", () {}),
          const Divider(),
          _settingsTile(Icons.shield_outlined, "Security", () {}),
          const Divider(),
          _settingsTile(Icons.info_outline, "About", () {}),
          const Divider(),
          _settingsTile(Icons.logout, "Logout", () {}),
        ],
      ),
    );
  }

  Widget _settingsTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: black),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

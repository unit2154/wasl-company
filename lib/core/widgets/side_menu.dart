import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/constants/images.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(AppImages.logo),
                ),
                const SizedBox(height: 10),
                const Text('اسم الشركة'),
              ],
            ),
          ),
          ListTile(
            title: const Text('الرئيسية'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('الطلبات'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('العروض'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('البضاعة'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('التعاملات'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

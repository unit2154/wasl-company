import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/constants/images.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('الرئيسية')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          onTap: (index) {},
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt),
              label: 'الطلبات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'العروض',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory),
              label: 'البضاعة',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.cabin),
              label: 'التعاملات',
            ),
          ],
          type: BottomNavigationBarType.fixed,
        ),
        body: const Center(child: Text('الرئيسية')),
      ),
    );
  }
}

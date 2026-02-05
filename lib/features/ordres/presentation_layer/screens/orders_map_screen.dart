import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';

class OrdersMapScreen extends StatelessWidget {
  const OrdersMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الرئيسية")),
      drawer: SideMenu(),
      body: Center(child: Text("خريطة الطلبات")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/widgets/bottom_nav_bar.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/orders_map_screen.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/orders_screen.dart';
import 'package:wasl_company_app/features/products/presentation_layer/screens/products_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        bottomNavigationBar: BottomNavBar(currentIndex: 2, onTap: (index) {}),
        body: IndexedStack(
          index: 2,
          children: [
            const Center(child: Text('الرئيسية')),
            const ProductsScreen(),
            const OrdersMapScreen(),
            const Center(child: Text('البضاعة')),
            const OrdersScreen(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';
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
      child: BlocProvider(
        create: (context) => DashboardCubit()..changeIndex(2),
        child: BlocBuilder<DashboardCubit, DashboardInitial>(
          builder: (context, state) {
            return Scaffold(
              bottomNavigationBar: BottomNavBar(
                currentIndex: state.currentIndex,
                onTap: (index) {
                  context.read<DashboardCubit>().changeIndex(index);
                },
              ),
              body: IndexedStack(
                index: state.currentIndex,
                children: [
                  const OrdersScreen(),
                  const Center(child: Text('الرئيسية')),
                  OrdersMapScreen(),
                  const ProductsScreen(),
                  const Center(child: Text('الرئيسية')),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

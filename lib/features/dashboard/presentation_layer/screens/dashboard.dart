import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/widgets/custom_bottom_nav_bar.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/commission.screen.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/orders_map_screen.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/orders_screen.dart';
import 'package:wasl_company_app/features/products/presentation_layer/screens/products_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => DashboardCubit()..changeIndex(2)),
          BlocProvider(create: (context) => getIt<OrdersCubit>()..getOrders()),
        ],
        child: BlocBuilder<DashboardCubit, DashboardInitial>(
          builder: (context, state) {
            context.read<OrdersCubit>().refreshOrders();
            return Scaffold(
              backgroundColor: AppColors.white,
              resizeToAvoidBottomInset: true,
              body: Stack(
                children: [
                  IndexedStack(
                    index: state.currentIndex,
                    children: [
                      const OrdersScreen(),
                      const Center(child: Text('الرئيسية')),
                      const OrdersMapScreen(),
                      const ProductsScreen(),
                      const CommissionScreen(),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: CustomBottomNavBar(
                      currentIndex: state.currentIndex,
                      changeIndex: (index) {
                        context.read<DashboardCubit>().changeIndex(index);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

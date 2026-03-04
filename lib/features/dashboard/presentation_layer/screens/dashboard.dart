import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/providers/cubit/dashboard_cubit.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/widgets/custom_bottom_nav_bar.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/commission.screen.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/orders_map_screen.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/orders_screen.dart';
import 'package:wasl_company_app/features/products/presentation_layer/providers/cubit/products_list_cubit.dart';
import 'package:wasl_company_app/features/products/presentation_layer/screens/add_product_screen.dart';
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
          BlocProvider(
            create: (context) => getIt<ProductsListCubit>()..getProducts(),
          ),
        ],
        child: BlocBuilder<DashboardCubit, DashboardInitial>(
          builder: (context, state) {
            context.read<OrdersCubit>().refreshOrders();
            return DefaultTabController(
              length: state.currentIndex == 0 ? 6 : 6,
              child: Scaffold(
                backgroundColor: AppColors.white,
                resizeToAvoidBottomInset: true,
                extendBody: true,
                bottomNavigationBar: CustomBottomNavBar(
                  currentIndex: state.currentIndex,
                  changeIndex: (index) {
                    context.read<DashboardCubit>().changeIndex(index);
                  },
                ),
                appBar: AppBar(
                  backgroundColor: AppColors.white,
                  surfaceTintColor: AppColors.white,
                  title: state.currentIndex == 0
                      ? Text('الطلبات')
                      : state.currentIndex == 1
                      ? Text('العروض')
                      : state.currentIndex == 3
                      ? Text('المنتجات')
                      : state.currentIndex == 4
                      ? Text('التعاملات')
                      : Row(
                          children: [
                            CircleAvatar(child: Image.asset(AppImages.logo)),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Text(
                              (context.read<AuthCubit>().state
                                      as VerifyOtpSuccess)
                                  .user
                                  .name,
                            ),
                          ],
                        ),
                  automaticallyImplyLeading: false,
                  actions: [
                    state.currentIndex == 3
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => BlocProvider.value(
                                    value: context.read<ProductsListCubit>(),
                                    child: const AddProductScreen(),
                                  ),
                                ),
                              );
                            },
                            child: const Text(
                              'إضافة منتج',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : const SizedBox(),
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),
                    ),
                  ],
                  bottom: state.currentIndex == 0
                      ? TabBar(
                          tabAlignment: TabAlignment.start,
                          indicatorColor: AppColors.primary,
                          isScrollable: true,
                          labelColor: AppColors.primary,
                          unselectedLabelColor: AppColors.textSecondary,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(text: 'الكل'),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.primary,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("جديدة"),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.orderStatePending,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("قيد المراجعة"),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.orderStatePending,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("قيد المعالجة"),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.orderStatePending,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("بانتضار التاكيد"),
                                ],
                              ),
                            ),
                            Tab(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.brightness_1,
                                    color: AppColors.orderStateRejected,
                                    size:
                                        (MediaQuery.of(context).size.height *
                                            .808799) *
                                        0.015,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Text("مرفوضة"),
                                ],
                              ),
                            ),
                          ],
                        )
                      : null,
                ),

                drawer: const SideMenu(),
                body: IndexedStack(
                  index: state.currentIndex,
                  children: [
                    const OrdersScreen(),
                    const Center(child: Text('الرئيسية')),
                    const OrdersMapScreen(),
                    const ProductsScreen(),
                    const CommissionScreen(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

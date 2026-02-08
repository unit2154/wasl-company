import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_tab_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BoxConstraints constraints = BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: (MediaQuery.of(context).size.height * 0.808799),
    );
    return DefaultTabController(
      length: 6, // number of tabs
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          title: const Text('الطلبات'),
          bottom: TabBar(
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
                      size: constraints.maxHeight * 0.015,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.01),
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
                      size: constraints.maxHeight * 0.015,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.01),
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
                      size: constraints.maxHeight * 0.015,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.01),
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
                      size: constraints.maxHeight * 0.015,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.01),
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
                      size: constraints.maxHeight * 0.015,
                    ),
                    SizedBox(width: constraints.maxWidth * 0.01),
                    Text("مرفوضة"),
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: SideMenu(),
        body: BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {
            switch (state) {
              case OrderUpdated():
                context.read<OrdersCubit>().getOrders();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    title: Center(
                      child: SvgPicture.asset(
                        AppIcons.order,
                        width: constraints.maxWidth * 0.05,
                        height: constraints.maxHeight * 0.05,
                      ),
                    ),
                    content: Text(
                      "تم تحديث الطلب بنجاح",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: constraints.maxHeight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                );
                break;
              default:
                break;
            }
          },
          builder: (context, state) {
            if (state is OrdersLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is OrdersError) {
              return Center(
                child: Column(
                  mainAxisSize: .min,
                  children: [
                    Text(
                      "حدث خطأ",
                      style: TextStyle(
                        fontSize: constraints.maxHeight * 0.02,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.02),
                    ElevatedButton(
                      onPressed: () {
                        context.read<OrdersCubit>().getOrders();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: .min,
                        children: [
                          Icon(Icons.refresh, color: AppColors.white),
                          SizedBox(width: constraints.maxWidth * 0.02),
                          Text(
                            "إعادة المحاولة",
                            style: TextStyle(
                              fontSize: constraints.maxHeight * 0.02,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is OrdersLoaded) {
              return TabBarView(
                children: [
                  OrderTabWidget(
                    orders: state.orderList,
                    constraints: constraints,
                  ),
                  OrderTabWidget(
                    orders: state.orderList
                        .where((order) => order.status == "pending")
                        .toList(),
                    constraints: constraints,
                  ),
                  OrderTabWidget(
                    orders: state.orderList
                        .where((order) => order.status == "reviewing")
                        .toList(),
                    constraints: constraints,
                  ),
                  OrderTabWidget(
                    orders: state.orderList
                        .where((order) => order.status == "processing")
                        .toList(),
                    constraints: constraints,
                  ),
                  OrderTabWidget(
                    orders: state.orderList
                        .where(
                          (order) => order.status == "awaiting_confirmation",
                        )
                        .toList(),
                    constraints: constraints,
                  ),
                  OrderTabWidget(
                    orders: state.orderList
                        .where((order) => order.status == "cancelled")
                        .toList(),
                    constraints: constraints,
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

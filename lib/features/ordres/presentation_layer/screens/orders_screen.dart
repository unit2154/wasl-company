import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_list_widget.dart';

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
              case OrdersError():
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
                break;
              case OrderUpdated():
                context.read<OrdersCubit>().getOrders();
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("تم تحديث الطلب")));
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
              return Center(child: Text(state.message));
            }
            if (state is OrdersLoaded) {
              return TabBarView(
                children: [
                  OrderListWidget(
                    orders: state.orderList,
                    constraints: constraints,
                  ),
                  OrderListWidget(
                    orders: state.orderList
                        .where((order) => order.status == "pending")
                        .toList(),
                    constraints: constraints,
                  ),
                  OrderListWidget(
                    orders: state.orderList
                        .where((order) => order.status == "reviewing")
                        .toList(),
                    constraints: constraints,
                  ),
                  OrderListWidget(
                    orders: state.orderList
                        .where((order) => order.status == "processing")
                        .toList(),
                    constraints: constraints,
                  ),
                  OrderListWidget(
                    orders: state.orderList
                        .where(
                          (order) => order.status == "awaiting_confirmation",
                        )
                        .toList(),
                    constraints: constraints,
                  ),
                  OrderListWidget(
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

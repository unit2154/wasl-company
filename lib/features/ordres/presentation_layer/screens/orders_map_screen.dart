import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/widgets/map.dart';
import 'package:wasl_company_app/core/widgets/search_bar.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/new_map_order_widget.dart';

class OrdersMapScreen extends StatelessWidget {
  const OrdersMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BoxConstraints constraints = BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: (MediaQuery.of(context).size.height * 0.808799),
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text("الرئيسية"),
      ),
      drawer: SideMenu(),
      body: Center(
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state is OrdersLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is OrdersLoaded) {
              List<OrderEntity> orders = state.orderList
                  .where((o) => o.status == "pending")
                  .toList();
              return Column(
                children: [
                  SearchInput(
                    onChanged: (value) {
                      context.read<OrdersCubit>().searchOrders(value);
                    },
                    onSubmitted: (value) {
                      context.read<OrdersCubit>().searchOrdersByItem(value);
                    },
                    height: constraints.maxHeight * 0.065,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      height: constraints.maxHeight * 0.4,
                      width: constraints.maxWidth * 0.95,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: MapWidget(),
                    ),
                  ),
                  SizedBox(height: constraints.maxHeight * 0.01),
                  SizedBox(
                    height: constraints.maxHeight * 0.43,
                    width: constraints.maxWidth * 0.95,
                    child: RefreshIndicator(
                      displacement: 20,
                      color: AppColors.primary,
                      onRefresh: () async {
                        context.read<OrdersCubit>().getOrders();
                      },
                      child: ListView.builder(
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return NewMapOrderWidget(
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            order: orders[index],
                            cubitContext: context,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              );
            } else if (state is OrdersError) {
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
                        mainAxisSize: MainAxisSize.min,
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
            } else {
              return Center(
                child: Column(
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
          },
        ),
      ),
    );
  }
}

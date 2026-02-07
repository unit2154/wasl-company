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
        child: BlocConsumer<OrdersCubit, OrdersState>(
          listener: (context, state) {
            if (state is OrdersError) {
              showDialog<Widget>(
                context: context,
                builder: (context) => const Center(child: Text("حدث خطأ")),
              );
            } else if (state is OrderUpdated) {
              context.read<OrdersCubit>().getOrders();
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text("تم تحديث الطلب")));
            }
          },

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
                    child: ListView.builder(
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
                ],
              );
            } else if (state is OrdersError) {
              return const Center(child: Text("حدث خطأ"));
            } else {
              return const Center(child: Text("حدث خطأ"));
            }
          },
        ),
      ),
    );
  }
}

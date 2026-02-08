import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/commission_card.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_commission_widget.dart';

class CommissionScreen extends StatelessWidget {
  const CommissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BoxConstraints constraints = BoxConstraints(
      maxWidth: MediaQuery.of(context).size.width,
      maxHeight: MediaQuery.of(context).size.height * 0.808999,
    );
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Text('التعاملات'),
      ),
      drawer: const SideMenu(),
      body: Center(
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            if (state is OrdersLoaded) {
              final shippedOrders = state.orderList
                  .where(
                    (order) =>
                        order.status == 'shipped' ||
                        order.status == 'delivered',
                  )
                  .toList();
              double total = 0;
              for (var order in shippedOrders) {
                total += double.parse(order.commissionAmount);
              }
              return Column(
                children: [
                  CommissionCard(
                    constraints: constraints,
                    total: total.toStringAsFixed(2),
                  ),
                  SizedBox(height: constraints.maxHeight * .02),
                  SizedBox(
                    height: constraints.maxHeight * 0.72,
                    width: constraints.maxWidth * .9,
                    child: ListView.builder(
                      itemCount: shippedOrders.length,
                      itemBuilder: (context, index) {
                        return OrderCommissionWidget(
                          order: shippedOrders[index],
                          constraints: constraints,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

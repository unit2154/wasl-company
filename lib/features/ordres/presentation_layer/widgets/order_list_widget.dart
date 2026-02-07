import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/widgets/search_bar.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_card_widget.dart';

class OrderListWidget extends StatelessWidget {
  final List<OrderEntity> orders;
  final BoxConstraints constraints;
  const OrderListWidget({
    super.key,
    required this.orders,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SearchInput(
            onChanged: (value) {
              context.read<OrdersCubit>().searchOrders(value);
            },
            height: constraints.maxHeight * 0.065,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) => OrderCard(
                cubitContext: context,
                order: orders[index],
                constraints: constraints,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

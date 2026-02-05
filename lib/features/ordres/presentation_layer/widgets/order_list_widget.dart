import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/widgets/search_bar.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_card_widget.dart';

class OrderListWidget extends StatelessWidget {
  final List<OrderEntity> orders;
  final BoxConstraints constraints;
  final BuildContext cubitContext;
  const OrderListWidget({
    super.key,
    required this.orders,
    required this.constraints,
    required this.cubitContext,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SearchInput(
            controller: TextEditingController(),
            height: constraints.maxHeight * 0.065,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) => OrderCard(
                cubitContext: cubitContext,
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

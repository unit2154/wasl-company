import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/order_details_screen.dart';

class OrderDialog extends StatelessWidget {
  const OrderDialog({
    super.key,
    required this.order,
    required this.height,
    required this.width,
    required this.cubitContext,
  });

  final OrderEntity order;
  final double height;
  final double width;
  final BuildContext cubitContext;

  @override
  Widget build(BuildContext context) {
    String status = "", action = "";
    if (order.status == "pending") {
      status = "reviewing";
      action = "قبول الطلب";
    } else if (order.status == "reviewing") {
      status = "processing";
      action = "تجهيز الطلب";
    } else if (order.status == "processing") {
      status = "delivering";
      action = "تسليم الطلب";
    }
    return Column(
      mainAxisSize: .min,
      children: [
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailsScreen(order: order),
            ),
          ),
          child: Text(
            "عرض التفاصيل",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        order.status != "delivered" &&
                order.status != "cancelled" &&
                order.status != "shipped"
            ? Divider(
                color: AppColors.primary,
                thickness: 1,
                height: 1,
                indent: width * 0.03,
                endIndent: width * 0.03,
              )
            : SizedBox(),
        order.status != "delivered" &&
                order.status != "cancelled" &&
                order.status != "shipped"
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubitContext.read<OrdersCubit>().updateOrderStatus(
                    order.id,
                    status,
                  );
                },
                child: Text(
                  action,
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : SizedBox(),
        order.status != "cancelled" &&
                order.status != "delivered" &&
                order.status != "shipped"
            ? Divider(
                color: AppColors.primary,
                thickness: 1,
                height: 1,
                indent: width * 0.03,
                endIndent: width * 0.03,
              )
            : SizedBox(),
        order.status != "cancelled" &&
                order.status != "shipped" &&
                order.status != "delivered"
            ? TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  cubitContext.read<OrdersCubit>().updateOrderStatus(
                    order.id,
                    "cancelled",
                  );
                },
                child: Text(
                  "رفض الطلب",
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: height * 0.02,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

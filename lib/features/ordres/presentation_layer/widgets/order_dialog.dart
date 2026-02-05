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
        Divider(
          color: AppColors.primary,
          thickness: 1,
          height: 1,
          indent: width * 0.03,
          endIndent: width * 0.03,
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            cubitContext.read<OrdersCubit>().confirmOrder(order.id);
          },
          child: Text(
            "تأكيد الطلب",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(
          color: AppColors.primary,
          thickness: 1,
          height: 1,
          indent: width * 0.03,
          endIndent: width * 0.03,
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            cubitContext.read<OrdersCubit>().rejectOrder(order.id);
          },
          child: Text(
            "رفض الطلب",
            style: TextStyle(
              color: AppColors.primary,
              fontSize: height * 0.02,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

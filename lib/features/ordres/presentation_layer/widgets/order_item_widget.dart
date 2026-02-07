import 'package:flutter/material.dart';

import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/sub_entities/order_item_entity.dart';

class OrderItemWidget extends StatelessWidget {
  const OrderItemWidget({
    super.key,
    required this.height,
    required this.width,
    required this.order,
  });

  final double height;
  final double width;
  final OrderItemEntity order;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: height * .005),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: ListTile(
        leading: Image.asset(
          "assets/images/item.png",
          width: width * .13,
          height: height * .13,
        ),
        title: Text(
          order.item!.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12 * (height / 650),
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          order.item!.price,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 12 * (height / 650),
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: Text(
          "الكمية : ${order.orderedQuantity}",
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 10 * (height / 650),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

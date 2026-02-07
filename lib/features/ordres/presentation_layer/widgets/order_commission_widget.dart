import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/order_details_screen.dart';

class OrderCommissionWidget extends StatelessWidget {
  final OrderEntity order;
  const OrderCommissionWidget({
    super.key,
    required this.constraints,
    required this.order,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(order: order),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: constraints.maxHeight * .02),
        height: constraints.maxHeight * .28,
        width: constraints.maxWidth * .9,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          mainAxisAlignment: .spaceAround,
          children: [
            Row(
              children: [
                SizedBox(width: constraints.maxWidth * .05),
                CircleAvatar(
                  radius: constraints.maxWidth * .07,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.person, color: AppColors.white),
                ),
                SizedBox(width: constraints.maxWidth * .03),
                Column(
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      order.endCustomer!.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: constraints.maxWidth * .04,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'رقم الفاتورة: ${order.orderNumber}',
                      style: TextStyle(
                        fontSize: constraints.maxWidth * .035,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: constraints.maxHeight * .1,
              width: constraints.maxWidth * .83,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.cardBorder),
              ),
              child: Column(
                mainAxisAlignment: .spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(width: constraints.maxWidth * .05),
                      Icon(Icons.receipt_long),
                      SizedBox(width: constraints.maxWidth * .02),
                      Text(
                        'الإجمالي',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * .04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Spacer(),
                      Text(
                        order.totalAmount.toString(),
                        style: TextStyle(
                          fontSize: constraints.maxWidth * .04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * .15),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: constraints.maxWidth * .05),
                      SvgPicture.asset(
                        AppIcons.commission,
                        height: constraints.maxHeight * .03,
                      ),
                      SizedBox(width: constraints.maxWidth * .02),
                      Text(
                        'النسبة',
                        style: TextStyle(
                          fontSize: constraints.maxWidth * .04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Spacer(),
                      Text(
                        order.commissionAmount.toString(),
                        style: TextStyle(
                          fontSize: constraints.maxWidth * .04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * .15),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SizedBox(width: constraints.maxWidth * .05),
                Icon(Icons.check_circle, color: AppColors.orderStateCompleted),
                SizedBox(width: constraints.maxWidth * .02),
                Text(
                  'تم التسليم في  ${DateTime.parse(order.shippedAt!).toLocal()}',
                  style: TextStyle(
                    fontSize: constraints.maxWidth * .04,
                    fontWeight: FontWeight.bold,
                    color: AppColors.orderStateCompleted,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

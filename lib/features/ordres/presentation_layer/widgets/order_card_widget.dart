import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/order_details_screen.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_dialog.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final BoxConstraints constraints;
  final BuildContext cubitContext;

  OrderCard({
    super.key,
    required this.order,
    required this.constraints,
    required this.cubitContext,
  });

  @override
  Widget build(BuildContext context) {
    var color, bcolor, btext;
    order.status == "pending"
        ? color = AppColors.orderStateNew
        : order.status == "cancelled"
        ? color = AppColors.orderStateRejected
        : order.status == "delivered"
        ? color = AppColors.orderStatePending
        : order.status == "processing"
        ? color = AppColors.orderStateNew
        : color = AppColors.orderStateCompleted;
    order.status == "pending"
        ? bcolor = AppColors.orderStateNewBackground
        : order.status == "cancelled"
        ? bcolor = AppColors.orderStateRejectedBackground
        : order.status == "delivered"
        ? bcolor = AppColors.orderStatePendingBackground
        : order.status == "processing"
        ? bcolor = AppColors.orderStateNewBackground
        : bcolor = AppColors.orderStateCompletedBackground;
    order.status == "pending"
        ? btext = "جديد"
        : order.status == "cancelled"
        ? btext = "مرفوض"
        : order.status == "delivered"
        ? btext = "تم التسليم"
        : order.status == "processing"
        ? btext = "قيد المعالجة"
        : btext = "تم";

    final double width = constraints.maxWidth;
    final double height = constraints.maxHeight;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => Center(
            child: Container(
              width: width * 0.7,
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: OrderDialog(
                order: order,
                height: height,
                width: width,
                cubitContext: cubitContext,
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: height * 0.02),
        child: Column(
          children: [
            Container(
              width: width * 0.9,
              decoration: ShapeDecoration(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03,
                  vertical: height * 0.013,
                ),
                child: Column(
                  spacing: height * 0.01,
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    // Order Status
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Container(
                          width: width * 0.24,
                          height: height * 0.038,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: bcolor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.brightness_1,
                                  color: color,
                                  size: width * .02,
                                ),
                                Text(
                                  btext,
                                  style: TextStyle(
                                    color: color,
                                    fontSize:
                                        12 *
                                        (MediaQuery.of(context).size.height /
                                            844),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          DateTime.parse(order.createdAt).toLocal().toString(),
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            color: const Color(0xFF646464),
                            fontSize: 14 * (height / 800),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    // Divider
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: height * 0.008),
                      child: Container(
                        width: width * .89,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: AppColors.cardBorder,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Customer Name and Order Number
                    Container(
                      width: width * .89,
                      height: height * .05,
                      padding: EdgeInsets.symmetric(horizontal: width * .02),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.cardBorder),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * .5,
                            child: TextScroll(
                              order.endCustomer!.name,
                              mode: TextScrollMode.bouncing,
                              velocity: Velocity(
                                pixelsPerSecond: Offset(20, 0),
                              ),
                              pauseBetween: Duration(microseconds: 50),
                              numberOfReps: 5,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14 * (height / 844),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * .275,
                            child: Text(
                              "رقم الطلب : ${order.orderNumber.split("-")[2]}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14 * (height / 844),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Shipping Address
                    Row(
                      children: [
                        SvgPicture.asset(AppIcons.location),
                        SizedBox(width: width * 0.01),
                        Text(
                          order.shippingAddress,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 14 * (height / 650),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    // Total Price
                    Row(
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImages.coins, width: width * 0.05),
                            SizedBox(width: width * 0.01),
                            Text(
                              "السعر الكلي",
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14 * (height / 650),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          "${order.totalAmount} دينار",
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontSize: 14 * (height / 650),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    // Commission
                    Row(
                      children: [
                        Icon(Icons.money),
                        SizedBox(width: width * 0.01),
                        Text(
                          "العمولة",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10 * (height / 650),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(width: width * 0.05),
                        Text(
                          "${order.commissionAmount} دينار",
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 10 * (height / 650),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_dialog.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final BoxConstraints constraints;

  const OrderCard({super.key, required this.order, required this.constraints});

  @override
  Widget build(BuildContext context) {
    String btext;
    Color color, bcolor;
    if (order.status == "pending") {
      color = AppColors.orderStateNew;
      bcolor = AppColors.orderStateNewBackground;
      btext = "جديد";
    } else if (order.status == "cancelled") {
      color = AppColors.orderStateRejected;
      bcolor = AppColors.orderStateRejectedBackground;
      btext = "مرفوض";
    } else if (order.status == "delivered" || order.status == "shipped") {
      color = AppColors.orderStateCompleted;
      bcolor = AppColors.orderStateCompletedBackground;
      btext = "تم التسليم";
    } else if (order.status == "reviewing") {
      color = AppColors.orderStatePending;
      bcolor = AppColors.orderStatePendingBackground;
      btext = "قيد المراجعة";
    } else if (order.status == "processing") {
      color = AppColors.orderStatePending;
      bcolor = AppColors.orderStatePendingBackground;
      btext = "قيد المعالجة";
    } else if (order.status == "awaiting_confirmation") {
      color = AppColors.orderStatePending;
      bcolor = AppColors.orderStatePendingBackground;
      btext = "انتضار التاكيد";
    } else {
      color = AppColors.orderStateNew;
      bcolor = AppColors.orderStateNewBackground;
      btext = "تم";
    }

    final double width = constraints.maxWidth;
    final double height = constraints.maxHeight;

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => BlocProvider.value(
            value: context.read<OrdersCubit>(),
            child: Center(
              child: Container(
                width: width * 0.7,
                decoration: ShapeDecoration(
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.cardBorder),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: OrderDialog(order: order, height: height, width: width),
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
                    Divider(
                      color: AppColors.cardBorder,
                      thickness: 2,
                      height: height * .01,
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
                            child: Text(
                              order.endCustomer!.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
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
                              textDirection: TextDirection.rtl,
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
                        SvgPicture.asset(
                          AppIcons.location,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
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
                        SvgPicture.asset(
                          AppIcons.commission,
                          width: width * 0.05,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
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

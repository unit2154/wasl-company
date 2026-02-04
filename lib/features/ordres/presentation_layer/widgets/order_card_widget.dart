import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/screens/order_details_screen.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final BoxConstraints constraints;

  OrderCard({super.key, required this.order, required this.constraints});

  @override
  Widget build(BuildContext context) {
    var color, bcolor, btext;
    order.status == "pending"
        ? color = AppColors.orderStateNew
        : order.status == "rejected"
        ? color = AppColors.orderStateRejected
        : order.status == "delivered"
        ? color = AppColors.orderStatePending
        : order.status == "processing"
        ? color = AppColors.orderStateNew
        : color = AppColors.orderStateCompleted;
    order.status == "pending"
        ? bcolor = AppColors.orderStateNewBackground
        : order.status == "rejected"
        ? bcolor = AppColors.orderStateRejectedBackground
        : order.status == "delivered"
        ? bcolor = AppColors.orderStatePendingBackground
        : order.status == "processing"
        ? bcolor = AppColors.orderStateNewBackground
        : bcolor = AppColors.orderStateCompletedBackground;
    order.status == "pending"
        ? btext = "جديد"
        : order.status == "rejected"
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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderDetailsScreen(order: order),
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
                            fontSize:
                                14 * (MediaQuery.of(context).size.height / 844),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
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
                            width: width * .38,
                            child: Text(
                              order.endCustomer!.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 14 * (height / 844),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * .4,
                            child: Text(
                              "رقم الطلب : ${order.orderNumber}",
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

                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.coins,
                          colorFilter: ColorFilter.mode(
                            AppColors.primary,
                            BlendMode.srcIn,
                          ),
                        ),
                        SizedBox(width: width * 0.01),
                        Text(
                          "السعر الكلي",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14 * (height / 650),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "${order.totalAmount} دينار",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14 * (height / 650),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_dialog.dart';

class NewMapOrderWidget extends StatelessWidget {
  const NewMapOrderWidget({
    super.key,
    required this.width,
    required this.height,
    required this.order,
  });

  final OrderEntity order;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
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
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.008),
        decoration: ShapeDecoration(
          color: AppColors.cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: .min,
          children: [
            // Order Status
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, top: 8),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Container(
                    width: width * 0.24,
                    height: height * 0.038,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: order.status == "pending"
                          ? AppColors.orderStateNewBackground
                          : order.status == "delivered" ||
                                order.status == "shipped"
                          ? AppColors.orderStateCompletedBackground
                          : order.status == "cancelled"
                          ? AppColors.orderStateRejectedBackground
                          : AppColors.orderStatePendingBackground,
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
                            color: order.status == "pending"
                                ? AppColors.orderStateNew
                                : order.status == "delivered" ||
                                      order.status == "shipped"
                                ? AppColors.orderStateCompleted
                                : order.status == "cancelled"
                                ? AppColors.orderStateRejected
                                : AppColors.orderStatePending,
                            size: width * .02,
                          ),
                          Text(
                            order.status == "pending"
                                ? "جديد"
                                : order.status == "delivered" ||
                                      order.status == "shipped"
                                ? "تم التسليم"
                                : order.status == "cancelled"
                                ? "مرفوض"
                                : order.status == "awaiting_confirmation"
                                ? "بانتظار التأكيد"
                                : order.status == "processing"
                                ? "قيد المعالجة"
                                : "قيد المراجعة",
                            style: TextStyle(
                              color: order.status == "pending"
                                  ? AppColors.orderStateNew
                                  : order.status == "delivered" ||
                                        order.status == "shipped"
                                  ? AppColors.orderStateCompleted
                                  : order.status == "cancelled"
                                  ? AppColors.orderStateRejected
                                  : AppColors.orderStatePending,
                              fontSize:
                                  12 *
                                  (MediaQuery.of(context).size.height / 844),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    DateTime.parse(
                      order.createdAt,
                    ).toLocal().toString().substring(0, 10),
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      color: const Color(0xFF646464),
                      fontSize: 14 * (height / 800),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            // Market Name
            Container(
              margin: EdgeInsets.symmetric(vertical: height * 0.01),
              height: height * 0.06,
              width: width * 0.9,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: BorderSide(color: AppColors.cardBorder),
                ),
              ),
              child: Row(
                children: [
                  SizedBox(width: width * 0.02),
                  // end market name
                  SizedBox(
                    width: width * 0.8,
                    child: Text(
                      order.endCustomer!.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.brightness_1,
                    size: height * 0.03,
                    color: order.status == "pending"
                        ? AppColors.orderStateNew
                        : order.status == "delivered" ||
                              order.status == "shipped"
                        ? AppColors.orderStateCompleted
                        : order.status == "cancelled"
                        ? AppColors.orderStateRejected
                        : AppColors.orderStatePending,
                  ),
                  SizedBox(width: width * 0.02),
                ],
              ),
            ),
            // Order Price and Location
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.02,
                vertical: height * 0.01,
              ),
              child: Row(
                children: [
                  Image.asset(AppImages.coins, height: height * 0.035),
                  Text(
                    " مجموع الطلب ${order.totalAmount} دينار",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: height * 0.018,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset(AppIcons.location),
                  SizedBox(
                    width: width * 0.2,
                    child: Text(
                      order.endCustomer!.address,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: height * 0.018,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

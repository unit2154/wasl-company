import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/providers/cubit/orders_cubit.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_item_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final OrderEntity order;
  const OrderDetailsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    Color color, bcolor;
    String btext;
    order.status == "pending"
        ? color = AppColors.orderStateNew
        : order.status == "rejected" || order.status == "cancelled"
        ? color = AppColors.orderStateRejected
        : order.status == "delivered" || order.status == "shipped"
        ? color = AppColors.orderStateCompleted
        : color = AppColors.orderStatePending;
    order.status == "pending"
        ? bcolor = AppColors.orderStateNewBackground
        : order.status == "rejected" || order.status == "cancelled"
        ? bcolor = AppColors.orderStateRejectedBackground
        : order.status == "delivered" || order.status == "shipped"
        ? bcolor = AppColors.orderStateCompletedBackground
        : bcolor = AppColors.orderStatePendingBackground;
    order.status == "pending"
        ? btext = "جديد"
        : order.status == "rejected" || order.status == "cancelled"
        ? btext = "مرفوض"
        : order.status == "delivered" || order.status == "shipped"
        ? btext = "تم التسليم"
        : order.status == "processing"
        ? btext = "قيد المعالجة"
        : order.status == "awaiting_confirmation"
        ? btext = "بانتظار التأكيد"
        : btext = "تم";

    final height = MediaQuery.of(context).size.height * 0.89;
    final width = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("تفاصيل الطلب")),
        body: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: height * 0.02),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                Container(
                  width: width * 0.9,
                  height: height * 0.96,
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
                        //? status and order number
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
                                        fontSize: 12 * (height / 800),
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
                              ).toLocal().toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: const Color(0xFF646464),
                                fontSize: 14 * (height / 800),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        // Separator
                        Divider(
                          color: AppColors.cardBorder,
                          thickness: 2,
                          height: height * .001,
                        ),
                        // market name and order number
                        Container(
                          width: width * .89,
                          height: height * .05,
                          padding: EdgeInsets.symmetric(
                            horizontal: width * .02,
                          ),
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
                                    fontSize: 14 * (height / 800),
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
                                    fontSize: 12 * (height / 800),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // location
                        Row(
                          children: [
                            SvgPicture.asset(AppIcons.location),
                            SizedBox(width: width * 0.01),
                            SizedBox(
                              width: width * .75,
                              height: height * .03,
                              child: Text(
                                order.shippingAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  color: AppColors.textSecondary,
                                  fontSize: 14 * (height / 650),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "المشتريات",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14 * (height / 650),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        //? list of items and total amount
                        BlocBuilder<OrdersCubit, OrdersState>(
                          builder: (context, state) {
                            double totalAmount = 0;
                            for (var element in order.orderItems!) {
                              if (element.item == null) {
                                continue;
                              }
                              totalAmount +=
                                  double.parse(element.item!.price) *
                                  element.orderedQuantity;
                            }
                            return Column(
                              children: [
                                SizedBox(
                                  height: height * .55,
                                  child: ListView.builder(
                                    itemCount: order.orderItems!.length,
                                    itemBuilder: (context, index) {
                                      if (order.orderItems![index].item ==
                                          null) {
                                        return const SizedBox.shrink();
                                      }
                                      return OrderItemWidget(
                                        cubitContext: context,
                                        height: height,
                                        width: width,
                                        order: order.orderItems![index],
                                        isEdit:
                                            order.status == "pending" ||
                                            order.status == "processing",
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: height * 0.05),
                                //? total amount
                                Container(
                                  width: width * .89,
                                  height: height * .06,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width * .02,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: AppColors.orderTotalBorder,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            AppImages.coins,
                                            width: width * 0.05,
                                          ),
                                          SizedBox(width: width * 0.01),
                                          Text(
                                            "مجموع الطلب",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: AppColors.orderTotalBorder,
                                              fontSize: 16 * (height / 844),
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "$totalAmount دينار",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: AppColors.orderTotalBorder,
                                          fontSize: 16 * (height / 844),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

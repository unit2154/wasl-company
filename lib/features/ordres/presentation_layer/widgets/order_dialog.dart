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
  });

  final OrderEntity order;
  final double height;
  final double width;

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
              builder: (_) => BlocProvider.value(
                value: context.read<OrdersCubit>(),
                child: OrderDetailsScreen(order: order),
              ),
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
                order.status != "shipped" &&
                order.status != "awaiting_confirmation"
            ? Column(
                mainAxisSize: .min,
                children: [
                  Divider(
                    color: AppColors.cardBorder,
                    thickness: 1,
                    height: 1,
                    indent: width * 0.03,
                    endIndent: width * 0.03,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      context.read<OrdersCubit>().updateOrderStatus(
                        order.id,
                        status,
                      );
                    },
                    child: Text(
                      action,
                      style: TextStyle(
                        color: AppColors.orderStatePending,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(),
        order.status != "cancelled" &&
                order.status != "shipped" &&
                order.status != "delivered" &&
                order.status != "awaiting_confirmation"
            ? Column(
                mainAxisSize: .min,
                children: [
                  Divider(
                    color: AppColors.cardBorder,
                    thickness: 1,
                    height: 1,
                    indent: width * 0.03,
                    endIndent: width * 0.03,
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => BlocProvider.value(
                          value: context.read<OrdersCubit>(),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: AlertDialog(
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  width * 0.03,
                                ),
                              ),
                              title: Center(
                                child: CircleAvatar(
                                  radius: width * 0.07,
                                  backgroundColor:
                                      AppColors.orderStateNewBackground,
                                  child: CircleAvatar(
                                    radius: width * 0.04,
                                    backgroundColor: AppColors.orderStateNew,
                                    child: Icon(
                                      Icons.close_outlined,
                                      color: AppColors.white,
                                      size: width * 0.06,
                                    ),
                                  ),
                                ),
                              ),
                              content: Column(
                                mainAxisSize: .min,
                                children: [
                                  Text(
                                    "يرجى توضيح سبب الرفض :",
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      context
                                          .read<OrdersCubit>()
                                          .updateOrderStatus(
                                            order.id,
                                            "cancelled",
                                          );
                                    },
                                    child: Container(
                                      width: width * 0.6,
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          width * 0.03,
                                        ),
                                        border: Border.all(
                                          color: AppColors.cardBorder,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "ضغط طلبيات مرتفع",
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                            fontSize: height * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      context
                                          .read<OrdersCubit>()
                                          .updateOrderStatus(
                                            order.id,
                                            "cancelled",
                                          );
                                    },
                                    child: Container(
                                      width: width * 0.6,
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          width * 0.03,
                                        ),
                                        border: Border.all(
                                          color: AppColors.cardBorder,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "الكميات المطلوبة غير متوفرة",
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                            fontSize: height * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: height * 0.02),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                      context
                                          .read<OrdersCubit>()
                                          .updateOrderStatus(
                                            order.id,
                                            "cancelled",
                                          );
                                    },
                                    child: Container(
                                      width: width * 0.6,
                                      height: height * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          width * 0.03,
                                        ),
                                        border: Border.all(
                                          color: AppColors.cardBorder,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "المتجر مديون",
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                            fontSize: height * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "رفض الطلب",
                      style: TextStyle(
                        color: AppColors.orderStateRejected,
                        fontSize: height * 0.02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ],
    );
  }
}

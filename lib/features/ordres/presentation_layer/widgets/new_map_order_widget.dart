import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:text_scroll/text_scroll.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/presentation_layer/widgets/order_dialog.dart';

class NewMapOrderWidget extends StatelessWidget {
  const NewMapOrderWidget({
    super.key,
    required this.width,
    required this.height,
    required this.order,
    required this.cubitContext,
  });

  final BuildContext cubitContext;
  final OrderEntity order;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
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
      child: Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.008),
        width: width * 0.95,
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
                  SizedBox(
                    width: width * 0.8,
                    child: TextScroll(
                      order.endCustomer!.name,
                      mode: TextScrollMode.bouncing,
                      velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
                      numberOfReps: 5,
                      pauseBetween: const Duration(milliseconds: 500),
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
                    color: AppColors.primary,
                  ),
                  SizedBox(width: width * 0.02),
                ],
              ),
            ),
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
                    child: TextScroll(
                      order.endCustomer!.address,
                      mode: TextScrollMode.bouncing,
                      velocity: const Velocity(pixelsPerSecond: Offset(20, 0)),
                      pauseBetween: const Duration(milliseconds: 500),
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

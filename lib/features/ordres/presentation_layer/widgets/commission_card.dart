import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';

class CommissionCard extends StatelessWidget {
  final String total;
  const CommissionCard({
    super.key,
    required this.constraints,
    required this.total,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraints.maxHeight * .25,
      width: constraints.maxWidth * .9,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            left: constraints.maxWidth * .5,
            child: Container(
              height: constraints.maxWidth * .45,
              width: constraints.maxWidth * .45,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: .1),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            left: constraints.maxWidth * .5,
            child: Container(
              height: constraints.maxWidth * .45,
              width: constraints.maxWidth * .45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.coins),
                  fit: BoxFit.scaleDown,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            right: constraints.maxWidth * .04,
            bottom: constraints.maxHeight * .04,
            child: Container(
              height: constraints.maxWidth * .45,
              width: constraints.maxWidth * .45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.income),
                  fit: BoxFit.scaleDown,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            left: constraints.maxWidth * .05,
            top: constraints.maxHeight * .05,
            child: Row(
              children: [
                Text(
                  DateTime.now().toIso8601String().substring(0, 10),
                  style: TextStyle(
                    fontSize: constraints.maxWidth * .05,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(width: constraints.maxWidth * .02),
                SvgPicture.asset(AppIcons.calendar),
              ],
            ),
          ),
          Positioned(
            left: constraints.maxWidth * .05,
            bottom: constraints.maxHeight * .05,
            child: Text(
              total,
              style: TextStyle(
                fontSize: constraints.maxWidth * .09,
                fontWeight: FontWeight.bold,
                color: AppColors.commissionTotal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Function(int) changeIndex;
  final int currentIndex;
  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.changeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.08,
        ),
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.02),
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.orderStateNew,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.orderStateNew.withValues(alpha: 0.4),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: .spaceAround,
          children: [
            GestureDetector(
              onTap: () => changeIndex(0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppIcons.orders,
                    colorFilter: currentIndex == 0
                        ? ColorFilter.mode(AppColors.white, BlendMode.srcATop)
                        : ColorFilter.mode(AppColors.white, BlendMode.dstIn),
                    width: MediaQuery.of(context).size.width * 0.025,
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    'الطلبات',
                    style: TextStyle(
                      fontSize: 11 * (MediaQuery.of(context).size.height / 800),
                      fontWeight: FontWeight.w700,
                      color: currentIndex == 0
                          ? AppColors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                  currentIndex == 0
                      ? Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.01,
                          ),
                          height: 2,
                          width: MediaQuery.of(context).size.width * 0.11,
                          color: AppColors.white,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => changeIndex(1),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppIcons.offers,
                    colorFilter: currentIndex == 1
                        ? ColorFilter.mode(AppColors.white, BlendMode.srcATop)
                        : ColorFilter.mode(AppColors.white, BlendMode.dstIn),
                    width: MediaQuery.of(context).size.width * 0.025,
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    'العروض',
                    style: TextStyle(
                      fontSize: 11 * (MediaQuery.of(context).size.height / 800),
                      fontWeight: FontWeight.w700,
                      color: currentIndex == 1
                          ? AppColors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                  currentIndex == 1
                      ? Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.01,
                          ),
                          height: 2,
                          width: MediaQuery.of(context).size.width * 0.11,
                          color: AppColors.white,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => changeIndex(2),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppIcons.home,
                    colorFilter: currentIndex == 2
                        ? ColorFilter.mode(AppColors.white, BlendMode.srcATop)
                        : ColorFilter.mode(AppColors.white, BlendMode.dstIn),
                    width: MediaQuery.of(context).size.width * 0.025,
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    'الرئيسية',
                    style: TextStyle(
                      fontSize: 11 * (MediaQuery.of(context).size.height / 800),
                      fontWeight: FontWeight.w700,
                      color: currentIndex == 2
                          ? AppColors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                  currentIndex == 2
                      ? Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.01,
                          ),
                          height: 2,
                          width: MediaQuery.of(context).size.width * 0.11,
                          color: AppColors.white,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => changeIndex(3),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppIcons.inventory,
                    colorFilter: currentIndex == 3
                        ? ColorFilter.mode(AppColors.white, BlendMode.srcATop)
                        : ColorFilter.mode(AppColors.white, BlendMode.dstIn),
                    width: MediaQuery.of(context).size.width * 0.025,
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    'المنتجات',
                    style: TextStyle(
                      fontSize: 11 * (MediaQuery.of(context).size.height / 800),
                      fontWeight: FontWeight.w700,
                      color: currentIndex == 3
                          ? AppColors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                  currentIndex == 3
                      ? Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.01,
                          ),
                          height: 2,
                          width: MediaQuery.of(context).size.width * 0.11,
                          color: currentIndex == 3
                              ? AppColors.white
                              : AppColors.textSecondary,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => changeIndex(4),
              child: Column(
                children: [
                  SvgPicture.asset(
                    AppIcons.deals,
                    colorFilter: currentIndex == 4
                        ? ColorFilter.mode(AppColors.white, BlendMode.srcATop)
                        : ColorFilter.mode(AppColors.white, BlendMode.dstIn),
                    width: MediaQuery.of(context).size.width * 0.025,
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Text(
                    'التعاملات',
                    style: TextStyle(
                      fontSize: 11 * (MediaQuery.of(context).size.height / 800),
                      fontWeight: FontWeight.w700,
                      color: currentIndex == 4
                          ? AppColors.white
                          : AppColors.textSecondary,
                    ),
                  ),
                  currentIndex == 4
                      ? Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width * 0.01,
                          ),
                          height: 2,
                          width: MediaQuery.of(context).size.width * 0.11,
                          color: AppColors.white,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

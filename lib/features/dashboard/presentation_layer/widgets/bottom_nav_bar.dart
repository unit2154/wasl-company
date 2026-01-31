import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/images.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int index) onTap;
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.orders),
          activeIcon: SvgPicture.asset(AppIcons.ordersActive),
          label: 'الطلبات',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.offers),
          activeIcon: SvgPicture.asset(AppIcons.offersActive),
          label: 'العروض',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.home),
          activeIcon: SvgPicture.asset(AppIcons.homeActive),
          label: "الرئيسية",
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.inventory),
          activeIcon: SvgPicture.asset(AppIcons.inventoryActive),
          label: 'البضاعة',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AppIcons.deals),
          activeIcon: SvgPicture.asset(AppIcons.dealsActive),
          label: 'التعاملات',
        ),
      ],
      type: BottomNavigationBarType.fixed,
    );
  }
}

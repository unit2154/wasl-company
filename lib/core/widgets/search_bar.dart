import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/constants/images.dart';

class SearchInput extends StatelessWidget {
  final TextEditingController? controller;
  final double height;
  final String? hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  const SearchInput({
    super.key,
    required this.height,
    this.controller,
    this.onChanged,
    this.hintText,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: height,
        child: TextField(
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          maxLines: 1,
          decoration: InputDecoration(
            hintText: hintText ?? ' ابحث عن عميل او منتج او رقم طلب',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                AppIcons.search,
                colorFilter: ColorFilter.mode(
                  AppColors.textSecondary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.cardBorder),
            ),
          ),
        ),
      ),
    );
  }
}

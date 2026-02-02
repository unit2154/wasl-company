import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/colors.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final BoxConstraints constraints;
  const TextInput({
    super.key,
    required this.label,
    this.prefixIcon,
    this.keyboardType,
    required this.controller,
    required this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 2.208, color: AppColors.inputBorder),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2.208, color: AppColors.primary),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.all(constraints.maxWidth * 0.01),
                child: Container(
                  width: constraints.maxWidth * 0.052,
                  height: constraints.maxWidth * 0.052,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.iconBackground,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: SvgPicture.asset(
                    prefixIcon!,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              )
            : null,
        prefixIconColor: AppColors.primary,
        labelText: label,
      ),
    );
  }
}

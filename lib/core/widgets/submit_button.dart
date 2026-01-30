import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/constants/colors.dart';

class SubmitButton extends StatelessWidget {
  final BoxConstraints constraints;
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool outline;
  const SubmitButton({
    super.key,
    required this.constraints,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.outline = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: outline ? Colors.white : AppColors.primary,
        foregroundColor: outline ? AppColors.primary : Colors.white,
        side: outline ? BorderSide(color: AppColors.primary) : null,
        fixedSize: Size(constraints.maxWidth, constraints.maxHeight * 0.056),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(
              text,
              style: TextStyle(
                fontSize: constraints.maxWidth * .046,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}

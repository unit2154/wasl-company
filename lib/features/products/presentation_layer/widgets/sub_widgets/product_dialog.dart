import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/features/dashboard/presentation_layer/screens/dashboard.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/presentation_layer/providers/cubit/products_list_cubit.dart';
import 'package:wasl_company_app/features/products/presentation_layer/screens/add_product_screen.dart';

class ProductDialog extends StatelessWidget {
  final ProductEntity product;
  const ProductDialog({
    super.key,
    required this.constraints,
    required this.product,
  });

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 219,
        height: 174,
        decoration: ShapeDecoration(
          color: const Color(0xFFFEFEFE),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "حذف المنتج",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: (constraints.maxWidth / 390) * 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(width: 180, height: 1, color: AppColors.cardBorder),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "جعل المنتج غير متوفر",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: (constraints.maxWidth / 390) * 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(width: 180, height: 1, color: AppColors.cardBorder),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProductScreen(product: product),
                  ),
                ).then((value) {
                  print("====================================");
                });
                getIt<ProductsListCubit>().updateProducts([]);
              },
              child: Text(
                "تعديل معلومات المنتج",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: (constraints.maxWidth / 390) * 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

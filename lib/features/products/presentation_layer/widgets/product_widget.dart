import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/presentation_layer/screens/products_screen.dart';

class Product extends StatelessWidget {
  final ProductEntity product;
  final BoxConstraints constraints;
  final BuildContext cubitContext;
  const Product({
    super.key,
    required this.product,
    required this.constraints,
    required this.cubitContext,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: cubitContext,
          builder: (dialogContext) => ProductDialog(
            constraints: constraints,
            product: product,
            cubitContext: cubitContext,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(6),
        // width: constraints.maxWidth * 0.428,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.cardBorder),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Container(
                width: double.infinity,
                height: 128,
                color: AppColors.cardBackground,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Image.asset("assets/images/item.png"),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.cardBorder),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/Edit.svg",
                          width: 16,
                          height: 16,
                        ),
                      ),
                    ),
                    product.availabilityStatus == "discontinued"
                        ? Positioned(
                            top: -3,
                            left: -32,
                            child: Transform.rotate(
                              angle: -0.8, // -45 degrees in radians
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 7,
                                  horizontal: 30,
                                ),
                                color: Colors.red,
                                child: Text(
                                  "offer",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: (constraints.maxWidth / 390) * 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      product.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: (constraints.maxWidth / 390) * 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "${product.price} IQD",
                      style: TextStyle(
                        color: product.availabilityStatus == "discontinued"
                            ? Colors.red
                            : AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 2),
                    product.images.isNotEmpty
                        ? Text(
                            (int.parse(product.price) -
                                    (int.parse(product.price) * (20 / 100)))
                                .ceil()
                                .toString(),
                            style: TextStyle(
                              color: const Color(0xFFFF0000),
                              fontSize: (constraints.maxWidth / 390) * 14,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

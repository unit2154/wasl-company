import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/widgets/submit_button.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/presentation_layer/widgets/product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
              height: constraints.maxHeight * 0.9,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 229,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 2,
                itemBuilder: (context, index) {
                  List<ProductEntity> products = [
                    ProductEntity(
                      id: 1,
                      name: "اسم المنتج",
                      description: "وصف مختصر",
                      price: "100",
                      images: "",
                      sku: '',
                      stockQuantity: 10,
                      availabilityStatus: '',
                      unit: '',
                      minOrderQuantity: '',
                      isActive: true,
                    ),
                    ProductEntity(
                      id: 1,
                      name: "معكرونة",
                      description: "وصف مختصر",
                      price: "200",
                      images: "",
                      sku: '',
                      stockQuantity: 10,
                      availabilityStatus: '',
                      unit: '',
                      minOrderQuantity: '',
                      isActive: true,
                    ),
                  ];
                  return Product(
                    product: products[index],
                    constraints: constraints,
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: constraints.maxWidth * 0.85,
              child: SubmitButton(
                constraints: constraints,
                text: "اضافة منتج جديد",
                onPressed: () {},
              ),
            ),
          ],
        );
      },
    );
  }
}

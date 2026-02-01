import 'package:flutter/material.dart';
import 'package:wasl_company_app/core/constants/colors.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            // mainAxisExtent: 200,
          ),
          itemBuilder: (context, index) {
            return Container(
              width: constraints.maxWidth * 0.428,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.cardBorder),
              ),
              margin: EdgeInsets.all(5),
              child: Column(
                children: [
                  Image.network(
                    "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                    height: 100,
                    width: 100,
                  ),
                  Text("Product Name"),
                  Text("Product Price"),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

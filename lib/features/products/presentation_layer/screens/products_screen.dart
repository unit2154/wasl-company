import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/widgets/submit_button.dart';
import 'package:wasl_company_app/core/widgets/side_menu.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/presentation_layer/providers/cubit/products_list_cubit.dart';
import 'package:wasl_company_app/features/products/presentation_layer/screens/add_product_screen.dart';
import 'package:wasl_company_app/features/products/presentation_layer/widgets/product_widget.dart';

part "../widgets/sub_widgets/product_dialog.dart";

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('المنتجات'),
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        automaticallyImplyLeading: false,
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<ProductsListCubit>(),
                    child: const AddProductScreen(),
                  ),
                ),
              );
            },
            child: const Text(
              'إضافة منتج',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // 👈 opens LEFT drawer
              },
            ),
          ),
        ],
      ),
      drawer: SideMenu(),
      body: BlocConsumer<ProductsListCubit, ProductsListState>(
        listenWhen: (previous, current) =>
            current is DeleteProductLoading || previous is DeleteProductLoading,
        listener: (context, state) {
          if (state is DeleteProductLoading) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("جاري حذف المنتج")));
          } else if (state is DeleteProductSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("تم حذف المنتج")));
          } else if (state is DeleteProductError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        buildWhen: (previous, current) =>
            current is ProductsListLoading ||
            previous is ProductsListLoading ||
            previous is AddProductSuccess,
        builder: (context, state) {
          if (state is ProductsListInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsListLoaded) {
            return LayoutBuilder(
              builder: (_, constraints) {
                return SizedBox(
                  height: constraints.maxHeight * 0.9,
                  child: state.productsList.isNotEmpty
                      ? RefreshIndicator(
                          onRefresh: () {
                            return context
                                .read<ProductsListCubit>()
                                .getProducts();
                          },
                          child: GridView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.8,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                            itemCount: state.productsList.length,
                            itemBuilder: (_, index) {
                              return Product(
                                product: state.productsList[index],
                                constraints: constraints,
                                cubitContext: context,
                              );
                            },
                          ),
                        )
                      : const Center(
                          child: Text(
                            "لا يوجد منتجات",
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 20,
                            ),
                          ),
                        ),
                );
              },
            );
          } else if (state is ProductsListError) {
            return Center(
              child: Column(
                mainAxisSize: .min,
                children: [
                  Text(
                    "حدث خطأ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProductsListCubit>().getProducts();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: .min,
                      children: [
                        Icon(Icons.refresh, color: AppColors.white),
                        SizedBox(width: 10),
                        Text(
                          "إعادة المحاولة",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is ProductsListUpdate) {
            return Center(child: const Text("تم تحديث المنتجات"));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

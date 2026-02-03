import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/widgets/submit_button.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/presentation_layer/providers/cubit/products_list_cubit.dart';
import 'package:wasl_company_app/features/products/presentation_layer/screens/add_product_screen.dart';
import 'package:wasl_company_app/features/products/presentation_layer/widgets/product_widget.dart';

part "../widgets/sub_widgets/product_dialog.dart";

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsListCubit>()..getProducts(),
      child: BlocConsumer<ProductsListCubit, ProductsListState>(
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
        builder: (context, state) {
          if (state is ProductsListInitial) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsListLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductsListLoaded) {
            return LayoutBuilder(
              builder: (_, constraints) {
                return Column(
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.9,
                      child: state.productsList.isNotEmpty
                          ? GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    // mainAxisExtent: 229,
                                    childAspectRatio: 0.77,
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
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: constraints.maxHeight * 0.07,
                      width: constraints.maxWidth * 0.85,
                      child: SubmitButton(
                        constraints: constraints,
                        prefixIcon: Icon(
                          Icons.add,
                          size: 25,
                          color: Colors.white,
                        ),
                        text: "اضافة منتج",
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
                      ),
                    ),
                  ],
                );
              },
            );
          } else if (state is ProductsListError) {
            return Center(child: Text(state.error));
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

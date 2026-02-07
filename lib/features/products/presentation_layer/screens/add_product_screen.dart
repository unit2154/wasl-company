import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/widgets/submit_button.dart';
import 'package:wasl_company_app/core/widgets/text_input.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/presentation_layer/providers/cubit/products_list_cubit.dart';

class AddProductScreen extends StatelessWidget {
  final ProductEntity? product;
  const AddProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    var updatedProduct = product;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text(product == null ? "اضافة منتج" : "تعديل منتج")],
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Center(
                    child: Container(
                      height: constraints.maxWidth * 0.3,
                      width: constraints.maxWidth * 0.3,
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.cardBorder,
                          width: 2,
                        ),
                      ),
                      child: const Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 50,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 10,
                    children: [
                      const Text("اسم المنتج"),
                      TextInput(
                        controller:
                            context.read<ProductsListCubit>().nameController
                              ..text = product?.name.toString() ?? "",
                        constraints: constraints,
                        onChanged: (value) {
                          product == null ? null : updatedProduct!.name = value;
                        },
                        onSubmitted: product != null
                            ? () {
                                context.read<ProductsListCubit>().updateProduct(
                                  updatedProduct!,
                                );
                              }
                            : null,
                      ),
                      const SizedBox(height: 10),
                      const Text("وصف المنتج"),
                      TextInput(
                        controller:
                            context
                                .read<ProductsListCubit>()
                                .descriptionController
                              ..text = product?.description.toString() ?? "",
                        constraints: constraints,
                        onChanged: (value) {
                          product == null
                              ? null
                              : updatedProduct!.description = value;
                        },
                        onSubmitted: product != null
                            ? () {
                                context.read<ProductsListCubit>().updateProduct(
                                  updatedProduct!,
                                );
                              }
                            : null,
                      ),
                      const SizedBox(height: 10),
                      const Text("السعر"),
                      TextInput(
                        keyboardType: TextInputType.number,
                        controller:
                            context.read<ProductsListCubit>().priceController
                              ..text = product?.price.toString() ?? "",
                        constraints: constraints,
                        onChanged: (value) {
                          product == null
                              ? null
                              : updatedProduct!.price = value;
                        },
                        onSubmitted: product != null
                            ? () {
                                context.read<ProductsListCubit>().updateProduct(
                                  updatedProduct!,
                                );
                              }
                            : null,
                      ),
                      const SizedBox(height: 10),
                      const Text("الكمية"),
                      TextInput(
                        controller:
                            context.read<ProductsListCubit>().stockController
                              ..text = product?.stockQuantity.toString() ?? "",
                        keyboardType: TextInputType.number,
                        constraints: constraints,
                        onChanged: (value) {
                          product == null
                              ? null
                              : updatedProduct!.stockQuantity = int.parse(
                                  value,
                                );
                        },
                        onSubmitted: product != null
                            ? () {
                                context.read<ProductsListCubit>().updateProduct(
                                  updatedProduct!,
                                );
                              }
                            : null,
                      ),
                      const SizedBox(height: 10),
                      const Text("الوحدة"),
                      TextInput(
                        controller:
                            context.read<ProductsListCubit>().unitController
                              ..text = product?.unit.toString() ?? "",
                        constraints: constraints,
                        onChanged: (value) {
                          product == null ? null : updatedProduct!.unit = value;
                        },
                        onSubmitted: product != null
                            ? () {
                                context.read<ProductsListCubit>().updateProduct(
                                  updatedProduct!,
                                );
                              }
                            : null,
                      ),
                      const SizedBox(height: 10),
                      const Text("الحد الادنى للطلب"),
                      TextInput(
                        keyboardType: TextInputType.number,
                        controller:
                            context
                                .read<ProductsListCubit>()
                                .minOrderQuantityController
                              ..text =
                                  product?.minOrderQuantity.toString() ?? "",
                        constraints: constraints,
                        onChanged: (value) {
                          product == null
                              ? null
                              : updatedProduct!.minOrderQuantity = value;
                        },
                        onSubmitted: product != null
                            ? () {
                                context.read<ProductsListCubit>().updateProduct(
                                  updatedProduct!,
                                );
                              }
                            : null,
                      ),
                      const SizedBox(height: 10),
                      const Text("الحالة"),
                      TextInput(
                        controller:
                            context.read<ProductsListCubit>().isActiveController
                              ..text = product?.isActive.toString() ?? "",
                        constraints: constraints,
                        onChanged: (value) {
                          product == null
                              ? null
                              : updatedProduct!.isActive = (value == "1");
                        },
                        onSubmitted: product != null
                            ? () {
                                context.read<ProductsListCubit>().updateProduct(
                                  updatedProduct!,
                                );
                              }
                            : null,
                      ),
                      const SizedBox(height: 10),
                      BlocConsumer<ProductsListCubit, ProductsListState>(
                        listener: (context, state) {
                          if (state is AddProductLoading) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("جاري الحفظ")),
                            );
                          } else if (state is AddProductSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("تم الحفظ")),
                            );
                            if (product != null) {
                              context.read<ProductsListCubit>().updateUI(
                                updatedProduct!,
                              );
                            }
                            Navigator.pop(context, true);
                          } else if (state is AddProductError) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(state.error)),
                            );
                          }
                        },
                        builder: (context, state) {
                          return SubmitButton(
                            constraints: constraints,
                            text: "حفظ",
                            onPressed: () {
                              if (product == null) {
                                context.read<ProductsListCubit>().addProduct();
                              } else {
                                context.read<ProductsListCubit>().updateProduct(
                                  updatedProduct!,
                                );
                              }
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wasl_company_app/core/constants/colors.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/widgets/submit_button.dart';
import 'package:wasl_company_app/core/widgets/text_input.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/presentation_layer/providers/cubit/add_product_cubit.dart';

class AddProductScreen extends StatelessWidget {
  final ProductEntity? product;
  const AddProductScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Text(product == null ? "اضافة منتج" : "تعديل منتج")],
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<AddProductCubit>(),
        child: Directionality(
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
                        child: Icon(
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
                        Text("اسم المنتج"),
                        TextInput(
                          controller: getIt<AddProductCubit>().nameController,
                          label: product?.name ?? "",
                          constraints: constraints,
                        ),
                        const SizedBox(height: 10),
                        Text("وصف المنتج"),
                        TextInput(
                          controller:
                              getIt<AddProductCubit>().descriptionController,
                          label: product?.description ?? "",
                          constraints: constraints,
                        ),
                        const SizedBox(height: 10),
                        Text("السعر"),
                        TextInput(
                          controller: getIt<AddProductCubit>().priceController,
                          label: product?.price ?? "",
                          constraints: constraints,
                        ),
                        const SizedBox(height: 10),
                        Text("الكمية"),
                        TextInput(
                          controller: getIt<AddProductCubit>().stockController,
                          label: product?.stockQuantity.toString() ?? "",
                          constraints: constraints,
                        ),
                        const SizedBox(height: 10),
                        Text("الوحدة"),
                        TextInput(
                          controller: getIt<AddProductCubit>().unitController,
                          label: product?.unit ?? "",
                          constraints: constraints,
                        ),
                        const SizedBox(height: 10),
                        Text("الحد الادنى للطلب"),
                        TextInput(
                          controller: getIt<AddProductCubit>()
                              .minOrderQuantityController,
                          label: product?.minOrderQuantity.toString() ?? "",
                          constraints: constraints,
                        ),
                        const SizedBox(height: 10),
                        Text("الحالة"),
                        TextInput(
                          controller:
                              getIt<AddProductCubit>().isActiveController,
                          label: product?.isActive.toString() ?? "",
                          constraints: constraints,
                        ),
                        const SizedBox(height: 10),
                        BlocConsumer<AddProductCubit, AddProductState>(
                          listener: (context, state) {
                            switch (state.runtimeType) {
                              case AddProductLoading:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("جاري الحفظ")),
                                );
                                break;
                              case AddProductSuccess:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("تم الحفظ")),
                                );
                                Navigator.pop(context);
                                break;
                              case AddProductError:
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("حدث خطأ")),
                                );
                                break;
                            }
                          },
                          builder: (context, state) {
                            return SubmitButton(
                              constraints: constraints,
                              text: "حفظ",
                              onPressed: () =>
                                  getIt<AddProductCubit>().addProduct(),
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
      ),
    );
  }
}

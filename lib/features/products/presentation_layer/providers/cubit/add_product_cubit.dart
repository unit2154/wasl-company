import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/add_product.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AddProductUseCase addProductUseCase;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController minOrderQuantityController =
      TextEditingController();
  final TextEditingController isActiveController = TextEditingController();

  AddProductCubit(this.addProductUseCase) : super(AddProductInitial());

  Future<void> addProduct() async {
    emit(AddProductLoading());
    final product = ProductEntity(
      id: 1,
      images: "imagesController.text",
      name: nameController.text,
      sku: "skuController.text",
      availabilityStatus: "availabilityStatusController.text",
      price: priceController.text,
      description: descriptionController.text,
      stockQuantity: 500,
      unit: unitController.text,
      minOrderQuantity: minOrderQuantityController.text,
      isActive: true,
    );
    final result = await addProductUseCase(product);
    result.fold(
      (l) => emit(AddProductError(l.message)),
      (r) => emit(AddProductSuccess()),
    );
  }
}

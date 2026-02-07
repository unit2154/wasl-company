import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
// ignore: unused_import
import 'package:wasl_company_app/features/products/domain_layer/entities/products_list_entity.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/add_product.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/delete_product.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/get_products.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/update_product.dart';
part 'products_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  final GetProductsUseCase getProductsUseCase;
  final UpdateProductUseCase updateProductUseCase;
  final AddProductUseCase addProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController stockController = TextEditingController();
  final TextEditingController unitController = TextEditingController();
  final TextEditingController minOrderQuantityController =
      TextEditingController();
  final TextEditingController isActiveController = TextEditingController();
  static List<ProductEntity> products = [];

  ProductsListCubit({
    required this.getProductsUseCase,
    required this.updateProductUseCase,
    required this.addProductUseCase,
    required this.deleteProductUseCase,
  }) : super(ProductsListInitial());

  Future<void> getProducts() async {
    emit(ProductsListLoading());
    final result = await getProductsUseCase();
    result.fold((l) => emit(ProductsListError(l.message)), (r) {
      products = r.products;
      emit(ProductsListLoaded(r.products));
    });
  }

  Future<void> addProduct() async {
    emit(AddProductLoading());
    final product = ProductEntity(
      id: 1,
      images: [],
      name: nameController.text.toString(),
      sku: String.fromEnvironment("skuController.text"),
      availabilityStatus: "available",
      price: priceController.text,
      description: descriptionController.text,
      stockQuantity: int.parse(stockController.text),
      unit: unitController.text,
      minOrderQuantity: minOrderQuantityController.text,
      isActive: true,
    );
    final result = await addProductUseCase(product);
    result.fold((l) => emit(AddProductError(l.message)), (r) {
      emit(AddProductSuccess());
      getProducts();
    });
  }

  Future<void> updateProduct(ProductEntity product) async {
    emit(AddProductLoading());
    final result = await updateProductUseCase(product);
    result.fold((l) => emit(AddProductError(l.message)), (r) {
      emit(AddProductSuccess());
    });
  }

  Future<void> deleteProduct(int id) async {
    emit(DeleteProductLoading());
    final result = await deleteProductUseCase(id);
    result.fold((l) => emit(DeleteProductError(l.message)), (r) {
      emit(DeleteProductSuccess());
      getProducts();
    });
  }

  void updateUI(ProductEntity product) {
    int index = products.indexWhere((element) => element.id == product.id);
    products[index] = product;
    emit(ProductsListLoaded(List<ProductEntity>.from(products)));
  }
}

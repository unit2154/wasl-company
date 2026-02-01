import 'package:wasl_company_app/features/products/data_layer/models/product_model.dart';
import 'package:wasl_company_app/features/products/data_layer/models/products_list_model.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';

abstract class ProductsDataSource {
  Future<ProductsListModel> getProducts();
  Future<ProductModel> getProductById(int id);
  Future<ProductModel> addProduct(ProductEntity product);
  Future<ProductModel> updateProduct(ProductEntity product);
  Future<void> deleteProduct(int id);
}

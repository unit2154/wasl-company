import 'package:wasl_company_app/core/constants/endpoints.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/core/network/dio_api_consumer.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';
import 'package:wasl_company_app/features/products/data_layer/data_sources/products_data_source.dart';
import 'package:wasl_company_app/features/products/data_layer/models/product_model.dart';
import 'package:wasl_company_app/features/products/data_layer/models/products_list_model.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final DioApiConsumer dio;
  final AuthRepo authRepo;
  ProductsDataSourceImpl({required this.dio, required this.authRepo});
  @override
  Future<ProductModel> addProduct(ProductEntity product) async {
    try {
      final response = await dio.post(
        Endpoints.products,
        data: product.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_getToken()}',
        },
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    try {
      await dio.delete(
        Endpoints.products,
        data: {'id': id},
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_getToken()}',
        },
      );
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<ProductsListModel> getProducts() async {
    try {
      final response = await dio.get(
        Endpoints.products,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_getToken()}',
        },
      );
      return ProductsListModel.fromJson(response.data);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<ProductModel> getProductById(int id) async {
    try {
      final response = await dio.get(
        '${Endpoints.products}/$id',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_getToken()}',
        },
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductEntity product) async {
    try {
      final response = await dio.put(
        '${Endpoints.products}/${product.id}',
        data: product.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_getToken()}',
        },
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  Future<String> _getToken() async {
    final token = await authRepo.getToken();
    return token.fold((l) => '', (r) => r.token);
  }
}

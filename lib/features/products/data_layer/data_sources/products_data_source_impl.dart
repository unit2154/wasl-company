import 'package:dio/dio.dart';
import 'package:wasl_company_app/core/constants/endpoints.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/core/network/dio_api_consumer.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';
import 'package:wasl_company_app/features/products/data_layer/data_sources/products_data_source.dart';
import 'package:wasl_company_app/features/products/data_layer/models/product_model.dart';
import 'package:wasl_company_app/features/products/data_layer/models/products_list_model.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final DioApiConsumer dio;
  final TokenEntity token = getIt<TokenEntity>();
  ProductsDataSourceImpl({required this.dio});
  @override
  Future<ProductModel> addProduct(ProductEntity product) async {
    try {
      final response = await dio.post(
        Endpoints.products,
        data: product.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${token.token}',
        },
      );
      print(response.data);
      return ProductModel.fromJson(response.data);
    } on DioException catch (e) {
      print(e.response?.data);
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
          'Authorization': 'Bearer ${token.token}',
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
          'Authorization': 'Bearer ${token.token}',
        },
        data: {'page': 1, 'per_page': 100},
      );
      print(response.data);
      return ProductsListModel.fromJson(response.data);
    } catch (e) {
      print(e);
      throw ServerFailure(message: "$e");
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
          'Authorization': 'Bearer ${token.token}',
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
          'Authorization': 'Bearer ${token.token}',
        },
      );
      return ProductModel.fromJson(response.data);
    } catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }
}

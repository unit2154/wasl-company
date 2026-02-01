import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/products_list_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, ProductsListEntity>> getProducts();
  Future<Either<Failure, ProductEntity>> getProductById(int id);
  Future<Either<Failure, ProductEntity>> addProduct(ProductEntity product);
  Future<Either<Failure, ProductEntity>> updateProduct(ProductEntity product);
  Future<Either<Failure, void>> deleteProduct(int id);
}

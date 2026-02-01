import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/products/data_layer/data_sources/products_data_source.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/products_list_entity.dart';
import 'package:wasl_company_app/features/products/domain_layer/repository/products_repo.dart';

class ProductsRepoImpl implements ProductsRepo {
  final ProductsDataSource remoteDataSource;

  ProductsRepoImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, ProductsListEntity>> getProducts() async {
    try {
      final products = await remoteDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProductById(int id) async {
    try {
      final product = await remoteDataSource.getProductById(id);
      return Right(product);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> addProduct(
    ProductEntity product,
  ) async {
    try {
      final addedProduct = await remoteDataSource.addProduct(product);
      return Right(addedProduct);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> updateProduct(
    ProductEntity product,
  ) async {
    try {
      final updatedProduct = await remoteDataSource.updateProduct(product);
      return Right(updatedProduct);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteProduct(int id) async {
    try {
      await remoteDataSource.deleteProduct(id);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}

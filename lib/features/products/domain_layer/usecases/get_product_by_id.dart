import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/domain_layer/repository/products_repo.dart';

class GetProductByIdUseCase {
  final ProductsRepo productsRepo;

  GetProductByIdUseCase(this.productsRepo);

  Future<Either<Failure, ProductEntity>> call(int id) async {
    return await productsRepo.getProductById(id);
  }
}

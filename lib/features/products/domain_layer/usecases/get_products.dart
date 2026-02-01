import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/products_list_entity.dart';
import 'package:wasl_company_app/features/products/domain_layer/repository/products_repo.dart';

class GetProductsUseCase {
  final ProductsRepo productsRepo;

  GetProductsUseCase(this.productsRepo);

  Future<Either<Failure, ProductsListEntity>> call() async {
    return await productsRepo.getProducts();
  }
}

import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
import 'package:wasl_company_app/features/products/domain_layer/repository/products_repo.dart';

class UpdateProductUseCase {
  final ProductsRepo productsRepo;

  UpdateProductUseCase(this.productsRepo);

  Future<Either<Failure, void>> call(ProductEntity product) async {
    return await productsRepo.updateProduct(product);
  }
}

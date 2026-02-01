import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/products/domain_layer/repository/products_repo.dart';

class DeleteProductUseCase {
  final ProductsRepo productsRepo;

  DeleteProductUseCase(this.productsRepo);

  Future<Either<Failure, void>> call(int id) async {
    return await productsRepo.deleteProduct(id);
  }
}

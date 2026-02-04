import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/orders_list_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/repository/orders_repo.dart';

class GetOrdersUseCase {
  final OrdersRepo repository;

  GetOrdersUseCase(this.repository);

  Future<Either<Failure, OrdersListEntity>> call() async {
    return await repository.getOrders();
  }
}

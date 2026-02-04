import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/repository/orders_repo.dart';

class EditOrderUseCase {
  final OrdersRepo repository;

  EditOrderUseCase({required this.repository});

  Future<Either<Failure, OrderEntity>> call(OrderEntity order) async {
    return await repository.editOrder(order);
  }
}

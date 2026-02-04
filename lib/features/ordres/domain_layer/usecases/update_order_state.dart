import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/repository/orders_repo.dart';

class UpdateOrderStateUseCase {
  final OrdersRepo repository;

  UpdateOrderStateUseCase({required this.repository});

  Future<Either<Failure, OrderEntity>> call(int orderId, int state) async {
    return await repository.updateOrderStatus(orderId, state.toString());
  }
}

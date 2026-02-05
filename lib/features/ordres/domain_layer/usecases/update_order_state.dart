import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/repository/orders_repo.dart';

class UpdateOrderStatusUseCase {
  final OrdersRepo repository;

  UpdateOrderStatusUseCase({required this.repository});

  Future<Either<Failure, void>> call(int orderId, String state) async {
    return await repository.updateOrderStatus(orderId, state);
  }
}

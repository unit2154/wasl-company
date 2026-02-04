import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/orders_list_entity.dart';

abstract class OrdersRepo {
  Future<Either<Failure, OrdersListEntity>> getOrders();
  Future<Either<Failure, OrderEntity>> getOrderById(int id);
  Future<Either<Failure, OrderEntity>> updateOrderStatus(int id, String status);
  Future<Either<Failure, OrderEntity>> editOrder(OrderEntity order);
}

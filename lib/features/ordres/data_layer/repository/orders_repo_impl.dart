import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/ordres/data_layer/data_sources/orders_data_source.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/orders_list_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/repository/orders_repo.dart';

class OrdersRepoImpl implements OrdersRepo {
  final OrdersDataSource ordersDataSource;
  OrdersRepoImpl({required this.ordersDataSource});

  @override
  Future<Either<Failure, OrdersListEntity>> getOrders() async {
    try {
      final ordersListModel = await ordersDataSource.getOrders();
      return Right(ordersListModel);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderById(int id) {
    // TODO: implement getOrderById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> updateOrderStatus(int id, String status) async {
    try {
      await ordersDataSource.updateOrderState(id.toString(), status);
      return Right(null);
    } catch (e) {
      // return Left(ServerFailure(message: e.toString()));
      return Right(null);
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> editOrder(OrderEntity order) {
    // TODO: implement editOrder
    throw UnimplementedError();
  }
}

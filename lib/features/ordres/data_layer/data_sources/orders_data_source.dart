import 'package:dio/dio.dart';
import 'package:wasl_company_app/core/constants/endpoints.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/exceptions/exceptions.dart';
import 'package:wasl_company_app/core/network/dio_api_consumer.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';
import 'package:wasl_company_app/features/ordres/data_layer/models/order_list_model.dart';
import 'package:wasl_company_app/features/ordres/data_layer/models/order_model.dart';

abstract class OrdersDataSource {
  Future<OrdersListModel> getOrders();
  Future<void> updateOrderState(String orderId, int state);
  Future<void> editOrder(OrderModel order);
}

class OrdersDataSourceImpl implements OrdersDataSource {
  final DioApiConsumer apiConsumer;
  OrdersDataSourceImpl({required this.apiConsumer});

  @override
  Future<OrdersListModel> getOrders() async {
    try {
      final response = await apiConsumer.get(
        Endpoints.orders,
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${getIt<TokenEntity>().token}",
        },
      );
      return OrdersListModel.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException(
        message:
            e.response?.data['message'] ??
            e.response?.data['error'] ??
            e.toString(),
      );
    }
  }

  @override
  Future<void> updateOrderState(String orderId, int state) {
    // TODO: implement updateOrderState
    throw UnimplementedError();
  }

  @override
  Future<void> editOrder(OrderModel order) {
    // TODO: implement editOrder
    throw UnimplementedError();
  }
}

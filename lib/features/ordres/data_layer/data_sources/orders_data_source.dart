import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:wasl_company_app/core/constants/endpoints.dart';
import 'package:wasl_company_app/core/exceptions/exceptions.dart';
import 'package:wasl_company_app/core/network/dio_api_consumer.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/token_entity.dart';
import 'package:wasl_company_app/features/ordres/data_layer/models/order_list_model.dart';
import 'package:wasl_company_app/features/ordres/data_layer/models/order_model.dart';

abstract class OrdersDataSource {
  Future<OrdersListModel> getOrders();
  Future<void> updateOrderState(String orderId, String status);
  Future<void> editOrder(OrderModel order);
}

class OrdersDataSourceImpl implements OrdersDataSource {
  final DioApiConsumer apiConsumer;
  final Box<TokenEntity> tokenBox;
  OrdersDataSourceImpl({required this.apiConsumer, required this.tokenBox});

  @override
  Future<OrdersListModel> getOrders() async {
    try {
      final response = await apiConsumer.get(
        Endpoints.orders,
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${tokenBox.getAt(0)?.token}",
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
  Future<void> updateOrderState(String orderId, String status) async {
    try {
      await apiConsumer.put(
        "${Endpoints.orders}/$orderId",
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${tokenBox.getAt(0)?.token}",
        },
        data: {"status": status, "notes": "", "tracking_number": ""},
      );
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
  Future<void> editOrder(OrderModel order) {
    // TODO: implement editOrder
    throw UnimplementedError();
  }
}

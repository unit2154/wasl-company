import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/get_orders.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/update_order_state.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateOrderStatusUseCase updateOrderStatusUseCase;

  List<OrderEntity> ordersList = [];

  OrdersCubit({
    required this.getOrdersUseCase,
    required this.updateOrderStatusUseCase,
  }) : super(OrdersInitial());

  Future<void> getOrders() async {
    emit(OrdersLoading());
    final result = await getOrdersUseCase();
    result.fold((failure) => emit(OrdersError(message: failure.message)), (
      ordersListEntity,
    ) {
      ordersList = ordersListEntity.orders ?? [];
      emit(OrdersLoaded(orderList: ordersList));
    });
  }

  Future<void> updateOrderStatus(int orderId, String status) async {
    emit(OrdersLoading());
    final result = await updateOrderStatusUseCase(orderId, status);
    result.fold(
      (failure) => emit(OrdersError(message: failure.message)),
      (orderEntity) => emit(OrderUpdated()),
    );
  }

  Future<void> searchOrders(String query) async {
    if (query.isEmpty) {
      emit(OrdersLoaded(orderList: ordersList));
      return;
    }
    var filteredOrdersList = ordersList
        .where(
          (order) =>
              order.orderNumber.toString().split('-').last.contains(query) ||
              order.endCustomer!.name.contains(query),
        )
        .toList();
    emit(OrdersLoaded(orderList: filteredOrdersList));
  }

  void refreshOrders() {
    emit(OrdersLoaded(orderList: ordersList));
  }
}

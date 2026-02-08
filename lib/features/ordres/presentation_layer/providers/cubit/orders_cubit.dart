import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/order_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/find_order_by_item.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/get_orders.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/update_order_state.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateOrderStatusUseCase updateOrderStatusUseCase;
  final FindOrderByItemUseCase findOrderByItemUseCase;

  List<OrderEntity> ordersList = [];

  OrdersCubit({
    required this.getOrdersUseCase,
    required this.updateOrderStatusUseCase,
    required this.findOrderByItemUseCase,
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
              order.orderNumber
                  .toString()
                  .split('-')
                  .last
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              order.endCustomer!.name.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();
    emit(OrdersLoaded(orderList: filteredOrdersList));
  }

  void refreshOrders() {
    emit(OrdersLoaded(orderList: ordersList));
  }

  Future<void> searchOrdersByItem(String itemName) async {
    var filteredOrdersList = await findOrderByItemUseCase(
      orders: ordersList,
      itemName: itemName,
    );
    emit(OrdersLoaded(orderList: filteredOrdersList));
  }

  void updateOrderItem() {
    emit(OrderItemUpdated());
  }
}

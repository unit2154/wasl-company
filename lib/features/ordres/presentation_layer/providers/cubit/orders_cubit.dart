import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/orders_list_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/get_orders.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/update_order_state.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  final UpdateOrderStatusUseCase updateOrderStatusUseCase;
  OrdersCubit({
    required this.getOrdersUseCase,
    required this.updateOrderStatusUseCase,
  }) : super(OrdersInitial());

  Future<void> getOrders() async {
    emit(OrdersLoading());
    final result = await getOrdersUseCase();
    result.fold(
      (failure) => emit(OrdersError(message: failure.message)),
      (ordersListEntity) =>
          emit(OrdersLoaded(ordersListEntity: ordersListEntity)),
    );
  }

  Future<void> confirmOrder(int orderId) async {
    emit(OrdersLoading());
    final result = await updateOrderStatusUseCase(orderId, "processing");
    result.fold(
      (failure) => emit(OrdersError(message: failure.message)),
      (orderEntity) => emit(OrderUpdated()),
    );
  }

  Future<void> rejectOrder(int orderId) async {
    emit(OrdersLoading());
    final result = await updateOrderStatusUseCase(orderId, "cancelled");
    result.fold(
      (failure) => emit(OrdersError(message: failure.message)),
      (orderEntity) => emit(OrderUpdated()),
    );
  }
}

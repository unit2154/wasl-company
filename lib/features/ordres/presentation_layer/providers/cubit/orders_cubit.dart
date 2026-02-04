import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/entities/orders_list_entity.dart';
import 'package:wasl_company_app/features/ordres/domain_layer/usecases/get_orders.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  OrdersCubit({required this.getOrdersUseCase}) : super(OrdersInitial());

  Future<void> getOrders() async {
    emit(OrdersLoading());
    final result = await getOrdersUseCase();
    result.fold(
      (failure) => emit(OrdersError(message: failure.message)),
      (ordersListEntity) =>
          emit(OrdersLoaded(ordersListEntity: ordersListEntity)),
    );
  }
}

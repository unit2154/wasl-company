part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersLoaded extends OrdersState {
  final List<OrderEntity> orderList;

  OrdersLoaded({required this.orderList});
}

final class OrderUpdated extends OrdersState {}

final class OrderRejected extends OrdersState {}

final class OrdersError extends OrdersState {
  final String message;

  OrdersError({required this.message});
}

final class OrderItemUpdated extends OrdersState {}

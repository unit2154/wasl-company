part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersLoading extends OrdersState {}

final class OrdersLoaded extends OrdersState {
  final OrdersListEntity ordersListEntity;

  OrdersLoaded({required this.ordersListEntity});
}

final class OrderUpdated extends OrdersState {}

final class OrdersError extends OrdersState {
  final String message;

  OrdersError({required this.message});
}

part of 'products_list_cubit.dart';

@immutable
sealed class ProductsListState {}

final class ProductsListInitial extends ProductsListState {}

final class ProductsListLoading extends ProductsListState {}

final class ProductsListLoaded extends ProductsListState {
  final List<ProductEntity> productsList;
  ProductsListLoaded(this.productsList);
}

final class ProductsListError extends ProductsListState {
  final String error;
  ProductsListError(this.error);
}

final class ProductsListUpdate extends ProductsListState {
  final List<ProductEntity> productsList;
  ProductsListUpdate(this.productsList);
}

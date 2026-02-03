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

final class AddProductLoading extends ProductsListState {}

final class AddProductSuccess extends ProductsListState {}

final class AddProductError extends ProductsListState {
  final String error;
  AddProductError(this.error);
}

final class DeleteProductLoading extends ProductsListState {}

final class DeleteProductSuccess extends ProductsListState {}

final class DeleteProductError extends ProductsListState {
  final String error;
  DeleteProductError(this.error);
}

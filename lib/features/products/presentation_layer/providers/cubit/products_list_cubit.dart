import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wasl_company_app/features/products/domain_layer/entities/product_entity.dart';
// ignore: unused_import
import 'package:wasl_company_app/features/products/domain_layer/entities/products_list_entity.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/get_products.dart';

part 'products_list_state.dart';

class ProductsListCubit extends Cubit<ProductsListState> {
  final GetProductsUseCase getProductsUseCase;
  ProductsListCubit(this.getProductsUseCase) : super(ProductsListInitial());

  Future<void> getProducts() async {
    emit(ProductsListLoading());
    final result = await getProductsUseCase();
    result.fold(
      (l) => emit(ProductsListError(l.message)),
      (r) => emit(ProductsListLoaded(r.products)),
    );
  }

  Future<void> updateProducts(List<ProductEntity> products) async {
    emit(ProductsListUpdate(products));
  }
}

import 'package:dio/dio.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/network/dio_api_consumer.dart';
import 'package:wasl_company_app/features/products/data_layer/data_sources/products_data_source.dart';
import 'package:wasl_company_app/features/products/data_layer/data_sources/products_data_source_impl.dart';
import 'package:wasl_company_app/features/products/data_layer/repository/products_reop_impl.dart';
import 'package:wasl_company_app/features/products/domain_layer/repository/products_repo.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/add_product.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/delete_product.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/get_products.dart';
import 'package:wasl_company_app/features/products/domain_layer/usecases/update_product.dart';
import 'package:wasl_company_app/features/products/presentation_layer/providers/cubit/products_list_cubit.dart';

Future<void> productsDependencies() async {
  getIt.registerFactory<ProductsListCubit>(
    () => ProductsListCubit(
      getProductsUseCase: getIt<GetProductsUseCase>(),
      addProductUseCase: getIt<AddProductUseCase>(),
      updateProductUseCase: getIt<UpdateProductUseCase>(),
      deleteProductUseCase: getIt<DeleteProductUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(getIt<ProductsRepo>()),
  );
  getIt.registerLazySingleton<ProductsRepo>(
    () => ProductsRepoImpl(productsDataSource: getIt<ProductsDataSource>()),
  );
  getIt.registerLazySingleton<ProductsDataSource>(
    () => ProductsDataSourceImpl(dio: getIt<DioApiConsumer>()),
  );
  getIt.registerLazySingleton<DioApiConsumer>(
    () => DioApiConsumer(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<AddProductUseCase>(
    () => AddProductUseCase(getIt<ProductsRepo>()),
  );
  getIt.registerLazySingleton<UpdateProductUseCase>(
    () => UpdateProductUseCase(getIt<ProductsRepo>()),
  );
  getIt.registerLazySingleton<DeleteProductUseCase>(
    () => DeleteProductUseCase(getIt<ProductsRepo>()),
  );
}

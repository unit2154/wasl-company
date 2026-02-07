part of 'locator.dart';

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
    () => ProductsDataSourceImpl(
      dio: getIt<DioApiConsumer>(),
      tokenBox: getIt<Box<TokenModel>>(),
      userBox: getIt<Box<UserModel>>(),
    ),
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

part of 'locator.dart';

Future<void> ordersDependencies() async {
  // ======================= Orders =======================
  getIt.registerFactory<OrdersCubit>(
    () => OrdersCubit(
      getOrdersUseCase: getIt<GetOrdersUseCase>(),
      updateOrderStatusUseCase: getIt<UpdateOrderStatusUseCase>(),
      findOrderByItemUseCase: getIt<FindOrderByItemUseCase>(),
    ),
  );
  getIt.registerLazySingleton<GetOrdersUseCase>(
    () => GetOrdersUseCase(getIt<OrdersRepo>()),
  );
  getIt.registerLazySingleton<UpdateOrderStatusUseCase>(
    () => UpdateOrderStatusUseCase(repository: getIt<OrdersRepo>()),
  );
  getIt.registerLazySingleton<FindOrderByItemUseCase>(
    () => FindOrderByItemUseCase(),
  );
  getIt.registerLazySingleton<OrdersRepo>(
    () => OrdersRepoImpl(ordersDataSource: getIt<OrdersDataSource>()),
  );
  getIt.registerLazySingleton<OrdersDataSource>(
    () => OrdersDataSourceImpl(
      apiConsumer: getIt<DioApiConsumer>(),
      tokenBox: getIt<Box<TokenModel>>(),
    ),
  );
}

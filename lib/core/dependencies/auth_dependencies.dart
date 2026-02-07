part of 'locator.dart';

Future<void> authDependencies() async {
  // ======================= Auth =======================

  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      send_otp: getIt<SendOtp>(),
      verify_otp: getIt<VerifyOtp>(),
      log_out: getIt<Logout>(),
      get_token: getIt<GetToken>(),
      get_user: getIt<GetUser>(),
    ),
  );
  getIt.registerLazySingleton<SendOtp>(
    () => SendOtp(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<VerifyOtp>(
    () => VerifyOtp(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<Logout>(
    () => Logout(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<GetToken>(
    () => GetToken(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<GetUser>(
    () => GetUser(authRepo: getIt<AuthRepo>()),
  );
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authDataSource: getIt<AuthDataSource>()),
  );
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      apiConsumer: getIt<ApiConsumer>(),
      userBox: getIt<Box<UserModel>>(),
      tokenBox: getIt<Box<TokenModel>>(),
    ),
  );
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioApiConsumer(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<Dio>(() => Dio());

  // ======================= Auth =======================
}

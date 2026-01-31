import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasl_company_app/core/dependencies/locator.dart';
import 'package:wasl_company_app/core/network/api_consumer.dart';
import 'package:wasl_company_app/core/network/dio_api_consumer.dart';
import 'package:wasl_company_app/features/auth/data_layer/data_sources/auth_data_source.dart';
import 'package:wasl_company_app/features/auth/data_layer/repo_impl/auth_repo_impl.dart';
import 'package:wasl_company_app/features/auth/domain_layer/repo/auth_repo.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/get_token.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/logout.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/send_otp.dart';
import 'package:wasl_company_app/features/auth/domain_layer/use_cases/verify_otp.dart';
import 'package:wasl_company_app/features/auth/presentation_layer/providers/cubit/auth_cubit.dart';

Future<void> authDependencies() async {
  // ======================= Auth =======================

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerFactory<AuthCubit>(
    () => AuthCubit(
      send_otp: getIt<SendOtp>(),
      verify_otp: getIt<VerifyOtp>(),
      log_out: getIt<Logout>(),
      get_token: getIt<GetToken>(),
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
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(authDataSource: getIt<AuthDataSource>()),
  );
  getIt.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      apiConsumer: getIt<ApiConsumer>(),
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioApiConsumer(dio: getIt<Dio>()),
  );
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  // ======================= Auth =======================
}

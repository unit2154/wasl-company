part of 'locator.dart';

Future<void> dbDependencies() async {
  // ======================= DB =======================
  getIt.registerLazySingleton<Box<TokenModel>>(
    () => Hive.box<TokenModel>(AppConstants.tokenBox),
  );
  getIt.registerLazySingleton<Box<UserModel>>(
    () => Hive.box<UserModel>(AppConstants.userBox),
  );
  // ======================= DB =======================
}

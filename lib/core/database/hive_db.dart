import 'package:hive_flutter/hive_flutter.dart';
import 'package:wasl_company_app/core/constants/app_constants.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/token_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/user_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TokenModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());
  await Hive.openBox<UserModel>(AppConstants.userBox);
  await Hive.openBox<TokenModel>(AppConstants.tokenBox);
  await Hive.openBox<ProfileModel>(AppConstants.profileBox);
}

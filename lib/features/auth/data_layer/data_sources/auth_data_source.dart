import 'package:wasl_company_app/core/message/message.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/token_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/user_model.dart';

abstract class AuthDataSource {
  Future<Message> sendOtp(String phone);
  Future<TokenModel> verifyOtp(String phone, String otp);
  Future<void> logout();
  Future<void> saveUser(UserModel userModel);
  Future<UserModel> getUser();
  Future<void> removeUser();
  Future<void> saveToken(TokenModel tokenModel);
  Future<TokenModel> getToken();
  Future<void> removeToken();
}

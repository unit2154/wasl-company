import 'dart:convert';

import 'package:wasl_company_app/core/constants/endpoints.dart';
import 'package:wasl_company_app/core/exceptions/exceptions.dart';
import 'package:wasl_company_app/core/message/message.dart';
import 'package:wasl_company_app/core/network/api_consumer.dart';
import 'package:wasl_company_app/features/auth/data_layer/data_sources/auth_data_source.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/token_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/user_model.dart';
import 'package:hive/hive.dart';

class AuthDataSourceImpl implements AuthDataSource {
  final Box<UserModel> userBox;
  final Box<TokenModel> tokenBox;
  final ApiConsumer apiConsumer;

  AuthDataSourceImpl({
    required this.userBox,
    required this.tokenBox,
    required this.apiConsumer,
  });

  @override
  Future<Message> sendOtp(String phone) async {
    try {
      var res = await apiConsumer.post(
        Endpoints.baseUrl + Endpoints.sendOtp,
        data: {'phone': phone},
      );
      return Message(message: jsonEncode(res.data));
    } on Exception catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<TokenModel> verifyOtp(String phone, String otp) async {
    try {
      var res = await apiConsumer.post(
        Endpoints.baseUrl + Endpoints.verifyOtp,
        data: {'phone': phone, 'otp': otp},
      );
      try {
        UserModel userModel = UserModel.fromJson(res.data['user']);
        TokenModel tokenModel = TokenModel.fromJson(res.data['token']);
        await saveUser(userModel);
        await saveToken(tokenModel);
      } catch (e) {
        print("error in save user and token $e");
        throw CacheException(message: "خطأ في حفظ البيانات");
      }
      return TokenModel.fromJson(res.data);
    } on Exception catch (e) {
      print("error in verify otp $e");
      throw ServerException(message: "$e");
    }
  }

  @override
  Future<void> logout() async {
    try {
      TokenModel tokenModel = await getToken();
      await apiConsumer.post(
        Endpoints.baseUrl + Endpoints.logout,
        headers: {'Authorization': 'Bearer ${tokenModel.token}'},
      );
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> saveUser(UserModel userModel) async {
    try {
      await userBox.add(userModel);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<UserModel> getUser() {
    try {
      UserModel? user = userBox.getAt(0);
      if (user == null) {
        throw CacheException(message: "No user found");
      }
      return Future.value(user);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeUser() async {
    try {
      await userBox.deleteAt(0);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> saveToken(TokenModel tokenModel) async {
    try {
      await tokenBox.add(tokenModel);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<TokenModel> getToken() {
    try {
      TokenModel? token = tokenBox.getAt(0);
      if (token == null) {
        throw CacheException(message: "No token found");
      }
      return Future.value(token);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      await tokenBox.deleteAt(0);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<ProfileModel> getProfile() {
    try {
      UserModel? user = userBox.get(1);
      if (user == null) {
        throw CacheException(message: "No profile found");
      }
      return Future.value(user.profile);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}

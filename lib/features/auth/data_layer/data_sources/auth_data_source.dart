import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wasl_company_app/core/constants/app_constants.dart';
import 'package:wasl_company_app/core/exceptions/exceptions.dart';
import 'package:wasl_company_app/core/message/message.dart';
import 'package:wasl_company_app/core/network/api_consumer.dart';
import 'package:wasl_company_app/core/constants/endpoints.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/sub_model/profile_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/token_model.dart';
import 'package:wasl_company_app/features/auth/data_layer/model/user_model.dart';

abstract class AuthDataSource {
  Future<Message> sendOtp(String phone);
  Future<TokenModel> verifyOtp(String phone, String otp);
  Future<void> logout();
  Future<UserModel> getUser();
  Future<void> removeUser();
  Future<TokenModel> getToken();
  Future<void> removeToken();
  Future<ProfileModel> getProfile();
  Future<void> removeProfile();
}

class AuthDataSourceImpl implements AuthDataSource {
  final ApiConsumer apiConsumer;
  final SharedPreferences sharedPreferences;

  AuthDataSourceImpl({
    required this.apiConsumer,
    required this.sharedPreferences,
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
        sharedPreferences.setString(AppConstants.token, res.data['token']);
      } catch (e) {
        throw CacheException(message: e.toString());
      }
      return TokenModel.fromJson(res.data);
    } on Exception catch (e) {
      print(e);
      throw ServerException(message: "الرقم غير صحيح");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await apiConsumer.post(
        Endpoints.baseUrl + Endpoints.logout,
        headers: {
          'Authorization':
              'Bearer ${sharedPreferences.getString(AppConstants.token)}',
        },
      );
      try {
        sharedPreferences.remove(AppConstants.token);
      } catch (e) {
        throw CacheException(message: e.toString());
      }
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<UserModel> getUser() async {
    try {
      final user = sharedPreferences.getString(AppConstants.user);
      if (user != null) {
        return UserModel.fromJson(jsonDecode(user));
      } else {
        throw CacheException(message: 'No user found');
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeUser() async {
    try {
      if (await sharedPreferences.remove(AppConstants.user)) {
        return;
      } else {
        throw CacheException(message: 'Failed to remove user');
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<TokenModel> getToken() async {
    try {
      final token = sharedPreferences.getString(AppConstants.token);
      if (token != null) {
        return TokenModel.fromJson(jsonDecode(token));
      } else {
        throw CacheException(message: 'No token found');
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      if (await sharedPreferences.remove(AppConstants.token)) {
        return;
      } else {
        throw CacheException(message: 'Failed to remove token');
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final profile = sharedPreferences.getString(AppConstants.profile);
      if (profile != null) {
        return ProfileModel.fromJson(jsonDecode(profile));
      } else {
        throw CacheException(message: 'No profile found');
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> removeProfile() async {
    try {
      if (await sharedPreferences.remove(AppConstants.profile)) {
        return;
      } else {
        throw CacheException(message: 'Failed to remove profile');
      }
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}

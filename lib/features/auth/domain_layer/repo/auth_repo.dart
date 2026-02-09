import 'package:dartz/dartz.dart';
import 'package:wasl_company_app/core/error/failure.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/user_entity.dart';
import 'package:wasl_company_app/core/message/message.dart';
import 'package:wasl_company_app/features/auth/domain_layer/entities/sub_entities/token_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, Message>> sendOtp(String phone);
  Future<Either<Failure, UserEntity>> verifyOtp(String phone, String otp);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, TokenEntity>> getToken();
  Future<Either<Failure, void>> removeToken();
  Future<Either<Failure, UserEntity>> getUser();
  Future<Either<Failure, void>> removeUser();
}
